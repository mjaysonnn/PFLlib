#!/bin/bash
# Function to generate IID data with specified number of clients
generate_data() {
    echo "Generating IID CIFAR-10 data with $1 clients..."
    cd ../dataset || exit
    rm -rf Cifar10/  # Deletes the entire Cifar10 folder
    python generate_Cifar10.py iid balance - $1
    cd ../system || exit
}

# Experiments with 500 rounds, and 1 local step
echo "Starting IID experiments with 500 rounds, and 1 local step"

# SCAFOFLD - 500 rounds, 1 local step
generate_data 50
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 500 -ls 1 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e1_iid_poisson_m50_scaffold"

# SCAFOLD - 250 rounds, 2 local steps
generate_data 50
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 250 -ls 2 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e2_iid_poisson_m50_scaffold"



# Function to generate non-IID data with specified number of clients
generate_noniid_data() {
    echo "Generating non-IID (Dirichlet) CIFAR-10 data with $1 clients..."
    cd ../dataset || exit
    rm -rf Cifar10/  # Deletes the entire Cifar10 folder
    python generate_Cifar10.py noniid - dir $1
    cd ../system || exit
}

# Experiments with 500 rounds, and 1 local step

# SCAFFOLD - 500 rounds, 1 local step
generate_noniid_data 50
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 500 -ls 1 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_dirichlet_m50_scaffold"

# SCAFFOLD - 250 rounds, 2 local steps
generate_noniid_data 50
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 250 -ls 2 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_dirichlet_m50_scaffold"

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

# SCFFOLD - 500 rounds, 1 local step
generate_pathological_data 50
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 500 -ls 1 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e1_pathological_poisson_m50_scaffold"

# SCAFFOLD - 250 rounds, 2 local steps
generate_pathological_data 50   
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 250 -ls 2 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e2_pathological_poisson_m50_scaffold"
: