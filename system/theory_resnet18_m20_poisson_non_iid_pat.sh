#!/bin/bash

# Running on View4

# Pathological Non-IID Data Generation and Experiment Scripts

# Function to generate pathological non-IID data with specified number of clients
generate_pathological_data() {
    echo "Generating pathological non-IID CIFAR-10 data with $1 clients..."
    cd ../dataset || exit
    rm -rf Cifar10/  # Deletes the entire Cifar10 folder
    python generate_Cifar10.py noniid - pat $1
    cd ../system || exit
}

# Experiments with 50 rounds and 10 local steps
echo "Starting pathological non-IID experiments with 50 rounds and 10 local steps"

# Spot(p20_q5) - 50 rounds, 10 local steps
generate_pathological_data 25
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 50 -ls 10 -nc 25 -jr 1.0 --on_demand_clients 20 --spot_clients 5 -lr 0.01 -lbs 32 -go "ResNet18_e10_poisson_pathological_m25_p20q5"

# Spot(p20_q10) - 50 rounds, 10 local steps
generate_pathological_data 30
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 50 -ls 10 -nc 30 -jr 1.0 --on_demand_clients 20 --spot_clients 10 -lr 0.01 -lbs 32 -go "ResNet18_e10_poisson_pathological_m30_p20q10"

# Spot(p20_q15) - 50 rounds, 10 local steps
generate_pathological_data 35
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 50 -ls 10 -nc 35 -jr 1.0 --on_demand_clients 20 --spot_clients 15 -lr 0.01 -lbs 32 -go "ResNet18_e10_poisson_pathological_m35_p20q15"

# Spot(p20_q20) - 50 rounds, 10 local steps
generate_pathological_data 40
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 50 -ls 10 -nc 40 -jr 1.0 --on_demand_clients 20 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e10_poisson_pathological_m40_p20q20"

# Experiments with 25 rounds and 20 local steps
echo "Starting pathological non-IID experiments with 25 rounds and 20 local steps"


# Spot(p20_q5) - 25 rounds, 20 local steps
generate_pathological_data 25
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 25 -ls 20 -nc 25 -jr 1.0 --on_demand_clients 20 --spot_clients 5 -lr 0.01 -lbs 32 -go "ResNet18_e20_poisson_pathological_m25_p20q5"

# Spot(p20_q10) - 25 rounds, 20 local steps
generate_pathological_data 30
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 25 -ls 20 -nc 30 -jr 1.0 --on_demand_clients 20 --spot_clients 10 -lr 0.01 -lbs 32 -go "ResNet18_e20_poisson_pathological_m30_p20q10"

# Spot(p20_q15) - 25 rounds, 20 local steps
generate_pathological_data 35
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 25 -ls 20 -nc 35 -jr 1.0 --on_demand_clients 20 --spot_clients 15 -lr 0.01 -lbs 32 -go "ResNet18_e20_poisson_pathological_m35_p20q15"

# Spot(p20_q20) - 25 rounds, 20 local steps
generate_pathological_data 40
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 25 -ls 20 -nc 40 -jr 1.0 --on_demand_clients 20 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e20_poisson_pathological_m40_p20q20"


echo "All pathological non-IID experiments completed!"
