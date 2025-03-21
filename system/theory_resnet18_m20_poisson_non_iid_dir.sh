#!/bin/bash

# Non-IID Data Generation and Experiment Scripts

# Function to generate non-IID data with specified number of clients
generate_noniid_data() {
    echo "Generating non-IID Dirichlet CIFAR-10 data with $1 clients..."
    cd ../dataset || exit
    rm -rf Cifar10/  # Deletes the entire Cifar10 folder
    python generate_Cifar10.py noniid - dir $1
    cd ../system || exit
}

# Experiments with 500 rounds, and 1 local step
echo "Starting non-IID experiments with 500 rounds, and 1 local step"

# Spot(p20_q5) - 500 rounds, 1 local step
generate_noniid_data 25
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 25 -jr 1.0 --on_demand_clients 20 --spot_clients 5 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_dirichlet_m20_p20q5"

# Spot(p20_q10) - 500 rounds, 1 local step
generate_noniid_data 30
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 30 -jr 1.0 --on_demand_clients 20 --spot_clients 10 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_dirichlet_m20_p20q10"

# Spot(p20_q15) - 500 rounds, 1 local step
generate_noniid_data 35
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 35 -jr 1.0 --on_demand_clients 20 --spot_clients 15 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_dirichlet_m20_p20q15"

# Spot(p20_q20) - 500 rounds, 1 local step
generate_noniid_data 40
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 40 -jr 1.0 --on_demand_clients 20 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_dirichlet_m20_p20q20"


# Experiments with 250 rounds, and 2 local step
echo "Starting non-IID experiments with 250 rounds, and 2 local step"

# Spot(p20_q5) - 250 rounds, 2 local step
generate_noniid_data 25
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 25 -jr 1.0 --on_demand_clients 20 --spot_clients 5 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_dirichlet_m20_p20q5"

# Spot(p20_q10) - 250 rounds, 2 local step
generate_noniid_data 30
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 30 -jr 1.0 --on_demand_clients 20 --spot_clients 10 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_dirichlet_m20_p20q10"

# Spot(p20_q15) - 250 rounds, 2 local step
generate_noniid_data 35
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 35 -jr 1.0 --on_demand_clients 20 --spot_clients 15 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_dirichlet_m20_p20q15"

# Spot(p20_q20) - 250 rounds, 2 local step
generate_noniid_data 40
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 40 -jr 1.0 --on_demand_clients 20 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_dirichlet_m20_p20q20"


echo "All non-IID experiments completed!"
