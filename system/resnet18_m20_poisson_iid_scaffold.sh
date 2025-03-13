#!/bin/bash

# Running on Jisoo1

# IID Data Generation and Experiment Scripts

# Function to generate data with specified number of clients
generate_data_iid() {
    echo "Generating IID CIFAR-10 data with $1 clients..."
    cd ../dataset || exit
    rm -rf Cifar10/  # Deletes the entire Cifar10 folder
    python generate_Cifar10.py iid balance - $1
    cd ../system || exit
}

# Experiments with 500 rounds, and 1 local step
echo "Starting experiments with 500 rounds and 1 local steps"

# Scaffold - 500 rounds, 1 local step
generate_data_iid 20
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 500 -ls 1 -nc 20 -jr 1.0 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e1_iid_poisson_m20_scaffold"

# Experiments with 250 rounds, and 2 local step
echo "Starting experiments with 250 rounds and 2 local steps"

# Scaffold - 250 rounds, 2 local steps
generate_data_iid 20
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 250 -ls 2 -nc 20 -jr 1.0 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e2_iid_poisson_m20_scaffold"


# Function to generate non-IID data with specified number of clients
generate_noniid_data_dir() {
    echo "Generating non-IID Dirichlet CIFAR-10 data with $1 clients..."
    cd ../dataset || exit
    rm -rf Cifar10/  # Deletes the entire Cifar10 folder
    python generate_Cifar10.py noniid - dir $1
    cd ../system || exit
}

# Experiments with 500 rounds, and 1 local step
echo "Starting non-IID experiments with 500 rounds, and 1 local step"

# Scaffold - 500 rounds, 1 local step
generate_noniid_data_dir 20
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 500 -ls 1 -nc 20 -jr 1.0 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_dirichlet_m20_scaffold"

# SCAFFOLD - 250 rounds, 2 local steps
generate_noniid_data_dir 20
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 250 -ls 2 -nc 20 -jr 1.0 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_dirichlet_m20_scaffold"


# Function to generate pathological non-IID data with specified number of clients
generate_pathological_data() {
    echo "Generating pathological non-IID CIFAR-10 data with $1 clients..."
    cd ../dataset || exit
    rm -rf Cifar10/  # Deletes the entire Cifar10 folder
    python generate_Cifar10.py noniid - pat $1
    cd ../system || exit
}

# Experiments with 500 rounds, and 1 local step
echo "Starting pathological non-IID experiments with 500 rounds, and 1 local step"

# SCAFOLD - 500 rounds, 1 local step
generate_pathological_data 20
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 500 -ls 1 -nc 20 -jr 1.0 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_pathological_m20_scaffold"

# SCAFFOLD - 250 rounds, 2 local steps
generate_pathological_data 20
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 250 -ls 2 -nc 20 -jr 1.0 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_pathological_m20_scaffold"


echo "All experiments completed!"
