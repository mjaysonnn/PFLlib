# PFLlib: Personalized Federated Learning Algorithm Library
# Copyright (C) 2021  Jianqing Zhang

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

import copy
import torch
import numpy as np
import time
import random
from flcore.clients.clientbase import Client
import math
from scipy.stats import rv_discrete
from scipy.special import factorial# Import for truncated Poisson distribution


def truncated_poisson(mu, lower, upper):
    """Create a truncated Poisson distribution without subclassing."""
    xk = np.arange(lower, upper + 1)
    pmf = np.exp(-mu) * (mu**xk) / factorial(xk)
    pmf /= pmf.sum()  # Normalize
    return rv_discrete(values=(xk, pmf))


class clientAVG(Client):
    def __init__(self, args, id, train_samples, test_samples, **kwargs):
        super().__init__(args, id, train_samples, test_samples, **kwargs)

    def train(self):
        trainloader = self.load_train_data()
        self.model.train()
        start_time = time.time()

        # Edge case: Handle invalid local epochs
        max_local_epochs = max(1, self.local_epochs)
        if self.train_slow:
            max_local_epochs = np.random.randint(1, max(2, max_local_epochs // 2))

        # Edge case: Handle empty trainloader
        num_batches = len(trainloader)
        if num_batches == 0:
            print(f"Client {self.id} - Warning: No batches to process")
            return
        
        for epoch in range(max_local_epochs):
            if "spot" in self.instance_type:
                spot_index = int(self.instance_type.split('_')[1])
                # Edge case: Handle invalid spot_strata
                num_strata = max(1, getattr(self, 'spot_strata', 1))
                
                # Edge case: Handle single batch
                if num_batches <= 1:
                    num_batches_to_process = 1
                elif num_strata > num_batches:
                    batch_values = np.arange(1, num_batches + 1)
                    assigned_batches = list(batch_values[:min(len(batch_values), num_strata)])
                    remaining_spots = num_strata - len(assigned_batches)
                    
                    if remaining_spots > 0:
                        bin_size = max(1, num_batches // remaining_spots)
                        batch_bins = [list(range(i * bin_size + 1, min((i + 1) * bin_size + 1, num_batches + 1)))
                                    for i in range(remaining_spots)]
                        
                        last_bin_end = batch_bins[-1][-1] if batch_bins else 0
                        if last_bin_end < num_batches:
                            batch_bins[-1].extend(range(last_bin_end + 1, num_batches + 1))
                        
                        for i in range(remaining_spots):
                            if batch_bins[i]:  # Edge case: Check if bin is not empty
                                assigned_batches.append(np.random.choice(batch_bins[i]))
                    
                    if not assigned_batches:  # Edge case: Handle empty assignments
                        num_batches_to_process = 1
                    else:
                        np.random.shuffle(assigned_batches)
                        num_batches_to_process = assigned_batches[spot_index % len(assigned_batches)]
                else:
                    bin_size = max(1, num_batches // num_strata)
                    batch_bins = [list(range(i * bin_size + 1, min((i + 1) * bin_size + 1, num_batches + 1)))
                                for i in range(num_strata)]
                    
                    last_bin_end = batch_bins[-1][-1] if batch_bins else 0
                    if last_bin_end < num_batches:
                        batch_bins[-1].extend(range(last_bin_end + 1, num_batches + 1))
                    
                    np.random.shuffle(batch_bins)
                    bin_choice = batch_bins[spot_index % num_strata]
                    num_batches_to_process = np.random.choice(bin_choice) if bin_choice else 1
                
                # Edge case: Ensure valid number of batches
                num_batches_to_process = max(1, min(num_batches_to_process, num_batches))
                
                print(f"Client {self.id} (Spot_{spot_index}) - Processing {num_batches_to_process} batches")
                
                batch_count = 0
                for i, (x, y) in enumerate(trainloader):
                    if type(x) == type([]):
                        x[0] = x[0].to(self.device)
                    else:
                        x = x.to(self.device)
                    y = y.to(self.device)
                    
                    if self.train_slow:
                        time.sleep(0.1 * np.abs(np.random.rand()))
                        
                    output = self.model(x)
                    loss = self.loss(output, y)
                    self.optimizer.zero_grad()
                    loss.backward()
                    self.optimizer.step()

                    batch_count += 1
                    if batch_count >= num_batches_to_process:
                        break

                
            else:
                # Original on-demand training code
                for i, (x, y) in enumerate(trainloader):
                    if type(x) == type([]):
                        x[0] = x[0].to(self.device)
                    else:
                        x = x.to(self.device)
                    y = y.to(self.device)
                    
                    if self.train_slow:
                        time.sleep(0.1 * np.abs(np.random.rand()))
                        
                    output = self.model(x)
                    loss = self.loss(output, y)
                    self.optimizer.zero_grad()
                    loss.backward()
                    self.optimizer.step()

        if self.learning_rate_decay:
            self.learning_rate_scheduler.step()

        self.train_time_cost['num_rounds'] += 1
        self.train_time_cost['total_cost'] += time.time() - start_time

