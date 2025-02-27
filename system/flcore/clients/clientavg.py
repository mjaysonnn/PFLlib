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

class clientAVG(Client):
    def __init__(self, args, id, train_samples, test_samples, **kwargs):
        super().__init__(args, id, train_samples, test_samples, **kwargs)

    def train(self):
        trainloader = self.load_train_data()
        self.model.train()
        start_time = time.time()

        max_local_epochs = self.local_epochs
        if self.train_slow:
            max_local_epochs = np.random.randint(1, max_local_epochs // 2)

        if self.instance_type == "spot":
            # Determine number of epochs to train based on current round
            total_rounds = self.global_rounds
            current_round = self.current_round
            
            # Calculate ranges based on max_local_epochs instead of batches
            num_ranges = math.floor(math.log2(max_local_epochs)) + 1 if max_local_epochs > 1 else 1
            
            # Calculate epoch ranges
            ranges = [1]
            for i in range(1, num_ranges):
                ranges.append(min(max_local_epochs, 2**i))
            if ranges[-1] < max_local_epochs:
                ranges.append(max_local_epochs)
            
            # Create epoch ranges for each section
            epoch_ranges = [(ranges[i], ranges[i+1]) for i in range(len(ranges) - 1)]
            
            # Determine current section based on round
            section = min(current_round // (total_rounds // len(epoch_ranges)), len(epoch_ranges) - 1)
            min_epochs, max_epochs = epoch_ranges[section]
            
            # Generate number of epochs to process
            epochs_to_process = np.random.randint(min_epochs, max_epochs + 1)
            # print(f"Client {self.id} is training for {epochs_to_process} epochs in section {section+1} of {len(epoch_ranges)}")
            
            # Train for the determined number of epochs
            for epoch in range(epochs_to_process):
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
                
        else:
            # Original on-demand training code
            for epoch in range(max_local_epochs):
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
