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

import numpy as np
import time
import math
from flcore.clients.clientbase import Client


class clientAVG(Client):
    """Client implementation for federated averaging with spot instance support.
    
    Implements stratified batch sampling for spot instances to ensure fair data
    distribution across different spot instance types.
    """

    def __init__(self, args, id, train_samples, test_samples, **kwargs):
        super().__init__(args, id, train_samples, test_samples, **kwargs)

    def train(self):
        trainloader = self.load_train_data()
        self.model.train()
        start_time = time.time()
        num_batches = len(trainloader)

        # Edge case: Handle invalid local epochs
        max_local_epochs = max(1, self.local_epochs)
        if self.train_slow:
            max_local_epochs = np.random.randint(1, max(2, max_local_epochs // 2))

        # Edge case: Handle empty trainloader
        if num_batches == 0:
            print(f"Client {self.id} - Warning: No batches to process")
            if self.learning_rate_decay:
                self.learning_rate_scheduler.step()
            self.train_time_cost['num_rounds'] += 1
            self.train_time_cost['total_cost'] += time.time() - start_time
            return

        for epoch in range(max_local_epochs):
            if "spot" in self.instance_type:
                spot_index = int(self.instance_type.split('_')[1])
                num_strata = max(1, getattr(self, 'spot_strata', 1))
                # print(f"\nClient {self.id} (Spot_{spot_index}) - Configuration:")
                # print(f"- Total batches: {num_batches}")
                # print(f"- Number of strata: {num_strata}")
                
                if num_batches <= 1:
                    num_batches_to_process = 1
                    # print(f"- Single batch case: all spots process batch 1")
                elif num_strata > num_batches:
                    base_assignments = list(range(1, num_batches + 1))
                    # print(f"- Base assignments: {base_assignments}")
                    
                    if spot_index < num_batches:
                        # First num_batches spots get direct assignments
                        num_batches_to_process = base_assignments[spot_index]
                        # print(f"- Spot_{spot_index} directly assigned to batch: {num_batches_to_process}")
                    else:
                        # Remaining spots use stratified sampling
                        remaining_spot = spot_index - num_batches
                        num_remaining_spots = num_strata - num_batches
                        
                        # Create stratified groups for remaining spots
                        batches_per_stratum = math.ceil(num_batches / num_remaining_spots)
                        strata_groups = []
                        for i in range(0, num_batches, batches_per_stratum):
                            group = base_assignments[i:i + batches_per_stratum]
                            if group:  # Only add non-empty groups
                                strata_groups.append(group)
                                
                        # print(f"- Stratified groups for remaining spots: {strata_groups}")
                        stratum_index = remaining_spot % len(strata_groups)
                        selected_stratum = strata_groups[stratum_index]
                        num_batches_to_process = np.random.choice(selected_stratum)
                        # print(f"- Remaining spot_{spot_index} assigned to stratum {stratum_index + 1}, batch: {num_batches_to_process}")


                else:
                    # Handle case when num_strata <= num_batches
                    bin_size = num_batches // num_strata
                    remaining_batches = num_batches % num_strata
                    # print(f"- Base bin size: {bin_size}")
                    # print(f"- Remaining batches: {remaining_batches}")
                    
                    batch_bins = []
                    start = 1
                    for i in range(num_strata):
                        current_bin_size = bin_size + (1 if i < remaining_batches else 0)
                        end = start + current_bin_size
                        batch_bins.append(list(range(start, end)))
                        start = end
                    
                    # print(f"- Bins distribution: {batch_bins}")
                    bin_choice = batch_bins[spot_index % num_strata]
                    num_batches_to_process = np.random.choice(bin_choice)
                    # print(f"- Selected batch: {num_batches_to_process}")

                # Process batches with logging
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

