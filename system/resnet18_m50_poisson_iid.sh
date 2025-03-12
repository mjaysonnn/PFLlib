#!/bin/bash

# Running on Jisoo4

# IID Data Generation and Experiment Scripts

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

# FedAvg - 500 rounds, 1 local steps
generate_data 50
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e1_iid_poisson_m50_fedavg"

# Spot(p10_q40) - 500 rounds, 1 local steps
generate_data 50
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 50 -jr 1.0 --on_demand_clients 10 --spot_clients 40 -lr 0.01 -lbs 32 -go "ResNet18_e1_iid_poisson_m50_p10q40"
# Spot(p10_q50) - 500 rounds, 1 local steps
generate_data 60
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 60 -jr 1.0 --on_demand_clients 10 --spot_clients 50 -lr 0.01 -lbs 32 -go "ResNet18_e1_iid_poisson_m50_p10q50"
# Spot(p10_q60) - 500 rounds, 1 local steps
generate_data 70
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 70 -jr 1.0 --on_demand_clients 10 --spot_clients 60 -lr 0.01 -lbs 32 -go "ResNet18_e1_iid_poisson_m50_p10q60"
# Spot(p10_q70) - 500 rounds, 1 local steps
generate_data 80
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 80 -jr 1.0 --on_demand_clients 10 --spot_clients 70 -lr 0.01 -lbs 32 -go "ResNet18_e1_iid_poisson_m50_p10q70"
# Spot(p10_q80) - 500 rounds, 1 local steps
generate_data 90
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 90 -jr 1.0 --on_demand_clients 10 --spot_clients 80 -lr 0.01 -lbs 32 -go "ResNet18_e1_iid_poisson_m50_p10q80"

# Spot(p20_q30) - 500 rounds, 1 local steps
generate_data 50
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 50 -jr 1.0 --on_demand_clients 20 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e1_iid_poisson_m50_p20q30"
# Spot(p20_q40) - 500 rounds, 1 local steps
generate_data 60
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 60 -jr 1.0 --on_demand_clients 20 --spot_clients 40 -lr 0.01 -lbs 32 -go "ResNet18_e1_iid_poisson_m50_p20q40"
# Spot(p20_q50) - 500 rounds, 1 local steps
generate_data 70
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 70 -jr 1.0 --on_demand_clients 20 --spot_clients 50 -lr 0.01 -lbs 32 -go "ResNet18_e1_iid_poisson_m50_p20q50"
# Spot(p20_q60) - 500 rounds, 1 local steps
generate_data 80
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 80 -jr 1.0 --on_demand_clients 20 --spot_clients 60 -lr 0.01 -lbs 32 -go "ResNet18_e1_iid_poisson_m50_p20q60"
# Spot(p20_q70) - 500 rounds, 1 local steps
generate_data 90
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 90 -jr 1.0 --on_demand_clients 20 --spot_clients 70 -lr 0.01 -lbs 32 -go "ResNet18_e1_iid_poisson_m50_p20q70"

# Spot(p30_q20) - 500 rounds, 1 local steps
generate_data 50
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 50 -jr 1.0 --on_demand_clients 30 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e1_iid_poisson_m50_p30q20"
# Spot(p30_q30) - 500 rounds, 1 local steps
generate_data 60
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 60 -jr 1.0 --on_demand_clients 30 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e1_iid_poisson_m50_p30q30"
# Spot(p30_q40) - 500 rounds, 1 local steps
generate_data 70
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 70 -jr 1.0 --on_demand_clients 30 --spot_clients 40 -lr 0.01 -lbs 32 -go "ResNet18_e1_iid_poisson_m50_p30q40"
# Spot(p30_q50) - 500 rounds, 1 local steps
generate_data 80
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 80 -jr 1.0 --on_demand_clients 30 --spot_clients 50 -lr 0.01 -lbs 32 -go "ResNet18_e1_iid_poisson_m50_p30q50"

# Spot(p40_q10) - 500 rounds, 1 local steps
generate_data 50
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 50 -jr 1.0 --on_demand_clients 40 --spot_clients 10 -lr 0.01 -lbs 32 -go "ResNet18_e1_iid_poisson_m50_p40q10"
# Spot(p40_q20) - 500 rounds, 1 local steps
generate_data 60
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 60 -jr 1.0 --on_demand_clients 40 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e1_iid_poisson_m50_p40q20"
# Spot(p40_q30) - 500 rounds, 1 local steps
generate_data 70
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 70 -jr 1.0 --on_demand_clients 40 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e1_iid_poisson_m50_p40q30"

# Experiments with 250 rounds, and 2 local step
echo "Starting IID experiments with 250 rounds, and 2 local step"

# FedAvg - 250 rounds, 2 local steps
generate_data 50
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e2_iid_poisson_m50_fedavg"

# Spot(p10_q40) - 250 rounds, 2 local steps (corrected from 250 rounds in table)
generate_data 50
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 50 -jr 1.0 --on_demand_clients 10 --spot_clients 40 -lr 0.01 -lbs 32 -go "ResNet18_e2_iid_poisson_m50_p10q40"
# Spot(p10_q50) - 250 rounds, 2 local steps (corrected from 250 rounds in table)
generate_data 60
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 60 -jr 1.0 --on_demand_clients 10 --spot_clients 50 -lr 0.01 -lbs 32 -go "ResNet18_e2_iid_poisson_m50_p10q50"
# Spot(p10_q60) - 250 rounds, 2 local steps (corrected from 250 rounds in table)
generate_data 70
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 70 -jr 1.0 --on_demand_clients 10 --spot_clients 60 -lr 0.01 -lbs 32 -go "ResNet18_e2_iid_poisson_m50_p10q60"

# Spot(p20_q30) - 250 rounds, 2 local steps
generate_data 50
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 50 -jr 1.0 --on_demand_clients 20 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e2_iid_poisson_m50_p20q30"
# Spot(p20_q40) - 250 rounds, 2 local steps
generate_data 60
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 60 -jr 1.0 --on_demand_clients 20 --spot_clients 40 -lr 0.01 -lbs 32 -go "ResNet18_e2_iid_poisson_m50_p20q40"
# Spot(p20_q50) - 250 rounds, 2 local steps
generate_data 70
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 70 -jr 1.0 --on_demand_clients 20 --spot_clients 50 -lr 0.01 -lbs 32 -go "ResNet18_e2_iid_poisson_m50_p20q50"
# Spot(p20_q60) - 250 rounds, 2 local steps
generate_data 80
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 80 -jr 1.0 --on_demand_clients 20 --spot_clients 60 -lr 0.01 -lbs 32 -go "ResNet18_e2_iid_poisson_m50_p20q60"
# Spot(p20_q70) - 250 rounds, 2 local steps
generate_data 90
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 90 -jr 1.0 --on_demand_clients 20 --spot_clients 70 -lr 0.01 -lbs 32 -go "ResNet18_e2_iid_poisson_m50_p20q70"

# Spot(p30_q20) - 250 rounds, 2 local steps
generate_data 50
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 50 -jr 1.0 --on_demand_clients 30 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e2_iid_poisson_m50_p30q20"
# Spot(p30_q30) - 250 rounds, 2 local steps
generate_data 60
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 60 -jr 1.0 --on_demand_clients 30 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e2_iid_poisson_m50_p30q30"
# Spot(p30_q40) - 250 rounds, 2 local steps
generate_data 70
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 70 -jr 1.0 --on_demand_clients 30 --spot_clients 40 -lr 0.01 -lbs 32 -go "ResNet18_e2_iid_poisson_m50_p30q40"
# Spot(p30_q50) - 250 rounds, 2 local steps
generate_data 80
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 80 -jr 1.0 --on_demand_clients 30 --spot_clients 50 -lr 0.01 -lbs 32 -go "ResNet18_e2_iid_poisson_m50_p30q50"

# Spot(p40_q10) - 250 rounds, 2 local steps
generate_data 50
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 50 -jr 1.0 --on_demand_clients 40 --spot_clients 10 -lr 0.01 -lbs 32 -go "ResNet18_e2_iid_poisson_m50_p40q10"
# Spot(p40_q20) - 250 rounds, 2 local steps
generate_data 60
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 60 -jr 1.0 --on_demand_clients 40 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e2_iid_poisson_m50_p40q20"
# Spot(p40_q30) - 250 rounds, 2 local steps
generate_data 70
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 70 -jr 1.0 --on_demand_clients 40 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e2_iid_poisson_m50_p40q30"

echo "All IID experiments completed!"