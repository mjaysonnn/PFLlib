#!/bin/bash

# Pathological Non-IID Data Generation and Experiment Scripts with 50 clients

# Function to generate pathological non-IID data with specified number of clients
generate_pathological_data() {
    echo "Generating pathological non-IID CIFAR-10 data with $1 clients..."
    cd ../dataset || exit
    rm -rf Cifar100/  # Deletes the entire Cifar10 folder
    python generate_Cifar100.py noniid - pat $1
    cd ../system || exit
}

# Experiments with 50 rounds and 10 local steps
echo "Starting pathological non-IID experiments with 50 rounds and 10 local steps (m50)"

# FedAvg - 50 rounds, 10 local steps
generate_pathological_data 50
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 50 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e10_pathological_m50_fedavg"

# Spot configurations with 10 on-demand clients
generate_pathological_data 50
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 50 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 10 --spot_clients 40 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e10_pathological_m50_p10q40"

generate_pathological_data 60
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 50 -ls 10 -nc 60 -jr 1.0 --on_demand_clients 10 --spot_clients 50 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e10_pathological_m50_p10q50"

generate_pathological_data 70
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 50 -ls 10 -nc 70 -jr 1.0 --on_demand_clients 10 --spot_clients 60 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e10_pathological_m50_p10q60"

generate_pathological_data 80
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 50 -ls 10 -nc 80 -jr 1.0 --on_demand_clients 10 --spot_clients 70 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e10_pathological_m50_p10q70"

generate_pathological_data 90
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 50 -ls 10 -nc 90 -jr 1.0 --on_demand_clients 10 --spot_clients 80 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e10_pathological_m50_p10q80"

# Spot configurations with 20 on-demand clients
generate_pathological_data 50
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 50 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 20 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e10_pathological_m50_p20q30"

generate_pathological_data 60
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 50 -ls 10 -nc 60 -jr 1.0 --on_demand_clients 20 --spot_clients 40 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e10_pathological_m50_p20q40"

generate_pathological_data 70
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 50 -ls 10 -nc 70 -jr 1.0 --on_demand_clients 20 --spot_clients 50 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e10_pathological_m50_p20q50"

generate_pathological_data 80
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 50 -ls 10 -nc 80 -jr 1.0 --on_demand_clients 20 --spot_clients 60 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e10_pathological_m50_p20q60"

generate_pathological_data 90
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 50 -ls 10 -nc 90 -jr 1.0 --on_demand_clients 20 --spot_clients 70 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e10_pathological_m50_p20q70"

# Spot configurations with 30 on-demand clients
generate_pathological_data 50
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 50 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 30 --spot_clients 20 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e10_pathological_m50_p30q20"

generate_pathological_data 60
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 50 -ls 10 -nc 60 -jr 1.0 --on_demand_clients 30 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e10_pathological_m50_p30q30"

generate_pathological_data 70
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 50 -ls 10 -nc 70 -jr 1.0 --on_demand_clients 30 --spot_clients 40 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e10_pathological_m50_p30q40"

generate_pathological_data 80
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 50 -ls 10 -nc 80 -jr 1.0 --on_demand_clients 30 --spot_clients 50 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e10_pathological_m50_p30q50"

# Spot configurations with 40 on-demand clients
generate_pathological_data 50
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 50 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 40 --spot_clients 10 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e10_pathological_m50_p40q10"

generate_pathological_data 60
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 50 -ls 10 -nc 60 -jr 1.0 --on_demand_clients 40 --spot_clients 20 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e10_pathological_m50_p40q20"

generate_pathological_data 70
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 50 -ls 10 -nc 70 -jr 1.0 --on_demand_clients 40 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e10_pathological_m50_p40q30"

# Experiments with 25 rounds and 20 local steps
echo "Starting pathological non-IID experiments with 25 rounds and 20 local steps (m50)"

# FedAvg - 25 rounds, 20 local steps
generate_pathological_data 50
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 25 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e20_pathological_m50_fedavg"

# Spot configurations with 10 on-demand clients
generate_pathological_data 50
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 25 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 10 --spot_clients 40 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e20_pathological_m50_p10q40"

generate_pathological_data 60
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 25 -ls 20 -nc 60 -jr 1.0 --on_demand_clients 10 --spot_clients 50 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e20_pathological_m50_p10q50"

generate_pathological_data 70
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 25 -ls 20 -nc 70 -jr 1.0 --on_demand_clients 10 --spot_clients 60 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e20_pathological_m50_p10q60"

generate_pathological_data 80
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 25 -ls 20 -nc 80 -jr 1.0 --on_demand_clients 10 --spot_clients 70 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e20_pathological_m50_p10q70"

generate_pathological_data 90
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 25 -ls 20 -nc 90 -jr 1.0 --on_demand_clients 10 --spot_clients 80 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e20_pathological_m50_p10q80"

# Spot configurations with 20 on-demand clients
generate_pathological_data 50
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 25 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 20 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e20_pathological_m50_p20q30"

generate_pathological_data 60
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 25 -ls 20 -nc 60 -jr 1.0 --on_demand_clients 20 --spot_clients 40 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e20_pathological_m50_p20q40"

generate_pathological_data 70
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 25 -ls 20 -nc 70 -jr 1.0 --on_demand_clients 20 --spot_clients 50 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e20_pathological_m50_p20q50"

generate_pathological_data 80
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 25 -ls 20 -nc 80 -jr 1.0 --on_demand_clients 20 --spot_clients 60 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e20_pathological_m50_p20q60"

generate_pathological_data 90
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 25 -ls 20 -nc 90 -jr 1.0 --on_demand_clients 20 --spot_clients 70 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e20_pathological_m50_p20q70"

# Spot configurations with 30 on-demand clients
generate_pathological_data 50
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 25 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 30 --spot_clients 20 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e20_pathological_m50_p30q20"

generate_pathological_data 60
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 25 -ls 20 -nc 60 -jr 1.0 --on_demand_clients 30 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e20_pathological_m50_p30q30"

generate_pathological_data 70
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 25 -ls 20 -nc 70 -jr 1.0 --on_demand_clients 30 --spot_clients 40 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e20_pathological_m50_p30q40"

generate_pathological_data 80
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 25 -ls 20 -nc 80 -jr 1.0 --on_demand_clients 30 --spot_clients 50 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e20_pathological_m50_p30q50"

# Spot configurations with 40 on-demand clients
generate_pathological_data 50
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 25 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 40 --spot_clients 10 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e20_pathological_m50_p40q10"

generate_pathological_data 60
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 25 -ls 20 -nc 60 -jr 1.0 --on_demand_clients 40 --spot_clients 20 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e20_pathological_m50_p40q20"

generate_pathological_data 70
python main.py -data Cifar100 -ncl 100-m ResNet18 -algo FedAvg -gr 25 -ls 20 -nc 70 -jr 1.0 --on_demand_clients 40 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e20_pathological_m50_p40q30"

echo "All pathological non-IID m50 experiments completed!"
