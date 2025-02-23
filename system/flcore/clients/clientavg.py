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


class clientAVG(Client):
    def __init__(self, args, id, train_samples, test_samples, **kwargs):
        super().__init__(args, id, train_samples, test_samples, **kwargs)
        # self.instance_type = "on-demand"

    def train(self):
        trainloader = self.load_train_data()
        # self.model.to(self.device)
        self.model.train()
        
        start_time = time.time()

        max_local_epochs = self.local_epochs
        if self.train_slow:
            max_local_epochs = np.random.randint(1, max_local_epochs // 2)  # Reduce epochs if train_slow

        num_batches = len(trainloader)  # Get the total number of batches

        # print(f"Client {self.id} - Instance Type: {self.instance_type}") # Make sure instance_type is being printed for a given client

        for epoch in range(max_local_epochs):  # training for number of local epochs
            if self.instance_type == "spot": # For spot Instance
                if num_batches <= 1:
                        random_num_batches = 1
                else:
                    random_num_batches = random.randint(1, num_batches)
                
                # print(f"Client {self.id} (SPOT): Epoch {epoch+1} - Processing {random_num_batches} random batches out of {num_batches}")

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

                    if batch_count >= random_num_batches:
                        # print(f"Client {self.id} (SPOT): Epoch {epoch+1} - Processed {random_num_batches} batches. Breaking inner loop.")
                        break  # Exit the inner loop after processing the random number of batches
            else: # If on demand, don't do anything
                # print(f"Client {self.id} (ON-DEMAND): Epoch {epoch+1} - Processing all batches.")
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

        # self.model.cpu()

        if self.learning_rate_decay:
            self.learning_rate_scheduler.step()

        self.train_time_cost['num_rounds'] += 1
        self.train_time_cost['total_cost'] += time.time() - start_time
        # print(f"Client {self.id}: Training completed. Total time: {time.time() - start_time:.2f} seconds")
