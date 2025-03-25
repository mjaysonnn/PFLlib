#!/bin/bash

# Pathological Non-IID Data Generation and Experiment Scripts with 50 clients

# Function to generate pathological non-IID data with specified number of clients
generate_pathological_data() {
    echo "Generating pathological non-IID CIFAR-10 data with $1 clients..."
    cd ../dataset || exit
    rm -rf TinyImagenet/  # Deletes the entire Cifar10 folder
    python generate_Cifar10.py noniid - pat $1
    cd ../system || exit
}

# Experiments with 500 rounds, and 1 local step
echo "Starting pathological non-IID experiments with 500 rounds, and 1 local step (m50)"

# FedAvg - 500 rounds, 1 local steps
generate_pathological_data 50
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 500 -ls 1 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e1_pathological_poisson_m50_fedavg"

# SCAFFOLD - 500 rounds, 1 local steps
# generate_pathological_data 50
# python main.py -data Cifar100 -m CNN -algo SCAFFOLD -gr 500 -ls 1 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e1_pathological_poisson_m50_scaffold"

# Spot configurations with 10 on-demand clients
generate_pathological_data 50
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 500 -ls 1 -nc 50 -jr 1.0 --on_demand_clients 10 --spot_clients 40 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e1_pathological_poisson_m50_p10q40"

generate_pathological_data 60
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 500 -ls 1 -nc 60 -jr 1.0 --on_demand_clients 10 --spot_clients 50 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e1_pathological_poisson_m50_p10q50"

generate_pathological_data 70
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 500 -ls 1 -nc 70 -jr 1.0 --on_demand_clients 10 --spot_clients 60 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e1_pathological_poisson_m50_p10q60"

generate_pathological_data 80
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 500 -ls 1 -nc 80 -jr 1.0 --on_demand_clients 10 --spot_clients 70 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e1_pathological_poisson_m50_p10q70"

generate_pathological_data 90
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 500 -ls 1 -nc 90 -jr 1.0 --on_demand_clients 10 --spot_clients 80 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e1_pathological_poisson_m50_p10q80"

# Spot configurations with 20 on-demand clients
generate_pathological_data 50
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 500 -ls 1 -nc 50 -jr 1.0 --on_demand_clients 20 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e1_pathological_poisson_m50_p20q30"

generate_pathological_data 60
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 500 -ls 1 -nc 60 -jr 1.0 --on_demand_clients 20 --spot_clients 40 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e1_pathological_poisson_m50_p20q40"

generate_pathological_data 70
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 500 -ls 1 -nc 70 -jr 1.0 --on_demand_clients 20 --spot_clients 50 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e1_pathological_poisson_m50_p20q50"

generate_pathological_data 80
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 500 -ls 1 -nc 80 -jr 1.0 --on_demand_clients 20 --spot_clients 60 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e1_pathological_poisson_m50_p20q60"

generate_pathological_data 90
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 500 -ls 1 -nc 90 -jr 1.0 --on_demand_clients 20 --spot_clients 70 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e1_pathological_poisson_m50_p20q70"

# Spot configurations with 30 on-demand clients
generate_pathological_data 50
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 500 -ls 1 -nc 50 -jr 1.0 --on_demand_clients 30 --spot_clients 20 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e1_pathological_poisson_m50_p30q20"

generate_pathological_data 60
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 500 -ls 1 -nc 60 -jr 1.0 --on_demand_clients 30 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e1_pathological_poisson_m50_p30q30"

generate_pathological_data 70
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 500 -ls 1 -nc 70 -jr 1.0 --on_demand_clients 30 --spot_clients 40 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e1_pathological_poisson_m50_p30q40"

generate_pathological_data 80
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 500 -ls 1 -nc 80 -jr 1.0 --on_demand_clients 30 --spot_clients 50 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e1_pathological_poisson_m50_p30q50"

# Spot configurations with 40 on-demand clients
generate_pathological_data 50
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 500 -ls 1 -nc 50 -jr 1.0 --on_demand_clients 40 --spot_clients 10 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e1_pathological_poisson_m50_p40q10"

generate_pathological_data 60
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 500 -ls 1 -nc 60 -jr 1.0 --on_demand_clients 40 --spot_clients 20 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e1_pathological_poisson_m50_p40q20"

generate_pathological_data 70
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 500 -ls 1 -nc 70 -jr 1.0 --on_demand_clients 40 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e1_pathological_poisson_m50_p40q30"

# Experiments with 250 rounds, and 2 local step
echo "Starting pathological non-IID experiments with 250 rounds, and 2 local step (m50)"

# FedAvg - 250 rounds, 2 local steps
generate_pathological_data 50
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 250 -ls 2 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e2_pathological_poisson_m50_fedavg"

# SCAFFOLD - 250 rounds, 2 local steps
# generate_pathological_data 50
# python main.py -data Cifar100 -m CNN -algo SCAFFOLD -gr 250 -ls 2 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e2_pathological_poisson_m50_scaffold"

# Spot configurations with 10 on-demand clients
generate_pathological_data 50
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 250 -ls 2 -nc 50 -jr 1.0 --on_demand_clients 10 --spot_clients 40 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e2_pathological_poisson_m50_p10q40"

generate_pathological_data 60
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 250 -ls 2 -nc 60 -jr 1.0 --on_demand_clients 10 --spot_clients 50 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e2_pathological_poisson_m50_p10q50"

generate_pathological_data 70
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 250 -ls 2 -nc 70 -jr 1.0 --on_demand_clients 10 --spot_clients 60 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e2_pathological_poisson_m50_p10q60"

generate_pathological_data 80
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 250 -ls 2 -nc 80 -jr 1.0 --on_demand_clients 10 --spot_clients 70 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e2_pathological_poisson_m50_p10q70"

generate_pathological_data 90
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 250 -ls 2 -nc 90 -jr 1.0 --on_demand_clients 10 --spot_clients 80 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e2_pathological_poisson_m50_p10q80"

# Spot configurations with 20 on-demand clients
generate_pathological_data 50
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 250 -ls 2 -nc 50 -jr 1.0 --on_demand_clients 20 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e2_pathological_poisson_m50_p20q30"

generate_pathological_data 60
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 250 -ls 2 -nc 60 -jr 1.0 --on_demand_clients 20 --spot_clients 40 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e2_pathological_poisson_m50_p20q40"

generate_pathological_data 70
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 250 -ls 2 -nc 70 -jr 1.0 --on_demand_clients 20 --spot_clients 50 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e2_pathological_poisson_m50_p20q50"

generate_pathological_data 80
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 250 -ls 2 -nc 80 -jr 1.0 --on_demand_clients 20 --spot_clients 60 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e2_pathological_poisson_m50_p20q60"

generate_pathological_data 90
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 250 -ls 2 -nc 90 -jr 1.0 --on_demand_clients 20 --spot_clients 70 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e2_pathological_poisson_m50_p20q70"

# Spot configurations with 30 on-demand clients
generate_pathological_data 50
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 250 -ls 2 -nc 50 -jr 1.0 --on_demand_clients 30 --spot_clients 20 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e2_pathological_poisson_m50_p30q20"

generate_pathological_data 60
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 250 -ls 2 -nc 60 -jr 1.0 --on_demand_clients 30 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e2_pathological_poisson_m50_p30q30"

generate_pathological_data 70
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 250 -ls 2 -nc 70 -jr 1.0 --on_demand_clients 30 --spot_clients 40 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e2_pathological_poisson_m50_p30q40"

generate_pathological_data 80
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 250 -ls 2 -nc 80 -jr 1.0 --on_demand_clients 30 --spot_clients 50 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e2_pathological_poisson_m50_p30q50"

# Spot configurations with 40 on-demand clients
generate_pathological_data 50
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 250 -ls 2 -nc 50 -jr 1.0 --on_demand_clients 40 --spot_clients 10 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e2_pathological_poisson_m50_p40q10"

generate_pathological_data 60
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 250 -ls 2 -nc 60 -jr 1.0 --on_demand_clients 40 --spot_clients 20 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e2_pathological_poisson_m50_p40q20"

generate_pathological_data 70
python main.py -data Cifar100 -m CNN -algo FedAvg -gr 250 -ls 2 -nc 70 -jr 1.0 --on_demand_clients 40 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e2_pathological_poisson_m50_p40q30"

echo "All pathological non-IID m50 experiments completed!"
