#!/bin/bash

# Running on View 5


# IID Data Generation and Experiment Scripts

# Function to generate IID data with specified number of clients
generate_data() {
    echo "Generating IID CIFAR-10 data with $1 clients..."
    cd ../dataset || exit
    rm -rf Cifar10/  # Deletes the entire Cifar10 folder
    python generate_Cifar10.py iid balance - $1
    cd ../system || exit
}

#   SCAFFOLD - 50 rounds, 10 local steps
generate_data 50
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 50 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e10_iid_poisson_m50_scaffold"

#  SCAFFOLD - 25 rounds, 20 local steps
generate_data 50
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 25 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e20_iid_poisson_m50_scaffold"



# Function to generate non-IID data with specified number of clients
generate_noniid_data() {
    echo "Generating non-IID (Dirichlet) CIFAR-10 data with $1 clients..."
    cd ../dataset || exit
    rm -rf Cifar10/  # Deletes the entire Cifar10 folder
    python generate_Cifar10.py noniid - dir $1
    cd ../system || exit
}

#  SCAFFOLD - 50 rounds, 10 local steps
generate_noniid_data 50
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 50 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e10_poisson_dirichlet_m50_scaffold"

#  SCAFFOLD - 25 rounds, 20 local steps
generate_noniid_data 50
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 25 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e20_poisson_dirichlet_m50_scaffold"

# Function to generate pathological non-IID data with specified number of clients
generate_pathological_data() {
    echo "Generating pathological non-IID CIFAR-10 data with $1 clients..."
    cd ../dataset || exit
    rm -rf Cifar10/  # Deletes the entire Cifar10 folder
    python generate_Cifar10.py noniid - pat $1
    cd ../system || exit
}

# SCAFFOLD - 50 rounds, 10 local steps
generate_pathological_data 50
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 50 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_scaffold"

# SCAFFOLD - 25 rounds, 20 local steps
generate_pathological_data 50
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 25 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_scaffold"
