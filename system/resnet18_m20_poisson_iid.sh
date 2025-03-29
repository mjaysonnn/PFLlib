#!/bin/bash

# IID Data Generation and Experiment Scripts

# Function to generate data with specified number of clients
generate_data() {
    echo "Generating IID CIFAR-100 data with $1 clients..."
    cd ../dataset || exit
    rm -rf Cifar100/ 
    python generate_Cifar100.py iid balance - $1
    cd ../system || exit
}

# Experiments with 500 rounds, and 1 local step
echo "Starting experiments with 500 rounds and 1 local steps"

# FedAvg - 500 rounds, 1 local step
generate_data 20
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 20 -jr 1.0 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e1_iid_m20_fedavg"

# Spot(p5_q15) - 500 rounds, 1 local step
generate_data 20
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 20 -jr 1.0 --on_demand_clients 5 --spot_clients 15 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e1_iid_m20_p5q15"
# Spot(p5_q20) - 500 rounds, 1 local step
generate_data 25
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 25 -jr 1.0 --on_demand_clients 5 --spot_clients 20 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e1_iid_m20_p5q20"
# Spot(p5_q30) - 500 rounds, 1 local step
generate_data 35
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 35 -jr 1.0 --on_demand_clients 5 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e1_iid_m20_p5q30"
# Spot(p5_q40) - 500 rounds, 1 local step
generate_data 45
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 45 -jr 1.0 --on_demand_clients 5 --spot_clients 40 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e1_iid_m20_p5q40"

# Spot(p10_q10) - 500 rounds, 1 local step
generate_data 20
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 20 -jr 1.0 --on_demand_clients 10 --spot_clients 10 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e1_iid_m20_p10q10"
# Spot(p10_q20) - 500 rounds, 1 local step
generate_data 30
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 30 -jr 1.0 --on_demand_clients 10 --spot_clients 20 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e1_iid_m20_p10q20"
# Spot(p10_q30) - 500 rounds, 1 local step
generate_data 40
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 40 -jr 1.0 --on_demand_clients 10 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e1_iid_m20_p10q30"

# Spot(p15_q5) - 500 rounds, 1 local step
generate_data 20
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 20 -jr 1.0 --on_demand_clients 15 --spot_clients 5 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e1_iid_m20_p15q5"
# Spot(p15_q10) - 500 rounds, 1 local step
generate_data 25
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 25 -jr 1.0 --on_demand_clients 15 --spot_clients 10 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e1_iid_m20_p15q10"
# Spot(p15_q20) - 500 rounds, 1 local step
generate_data 35
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 35 -jr 1.0 --on_demand_clients 15 --spot_clients 20 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e1_iid_m20_p15q20"
# Spot(p15_q30) - 500 rounds, 1 local step
generate_data 45
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 500 -ls 1 -nc 45 -jr 1.0 --on_demand_clients 15 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e1_iid_m20_p15q30"

# Experiments with 250 rounds, and 2 local step
echo "Starting experiments with 250 rounds and 2 local steps"

# FedAvg - 250 rounds, 2 local steps
generate_data 20
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 20 -jr 1.0 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e2_iid_m20_fedavg"

# Spot(p5_q15) - 250 rounds, 2 local steps
generate_data 20
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 20 -jr 1.0 --on_demand_clients 5 --spot_clients 15 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e2_iid_m20_p5q15"
# Spot(p5_q20) - 250 rounds, 2 local steps
generate_data 25
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 25 -jr 1.0 --on_demand_clients 5 --spot_clients 20 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e2_iid_m20_p5q20"
# Spot(p5_q30) - 250 rounds, 2 local steps
generate_data 35
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 35 -jr 1.0 --on_demand_clients 5 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e2_iid_m20_p5q30"
# Spot(p5_q40) - 250 rounds, 2 local steps
generate_data 45
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 45 -jr 1.0 --on_demand_clients 5 --spot_clients 40 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e2_iid_m20_p5q40"

# Spot(p10_q10) - 250 rounds, 2 local steps
generate_data 20
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 20 -jr 1.0 --on_demand_clients 10 --spot_clients 10 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e2_iid_m20_p10q10"
# Spot(p10_q20) - 250 rounds, 2 local steps
generate_data 30
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 30 -jr 1.0 --on_demand_clients 10 --spot_clients 20 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e2_iid_m20_p10q20"
# Spot(p10_q30) - 250 rounds, 2 local steps
generate_data 40
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 40 -jr 1.0 --on_demand_clients 10 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e2_iid_m20_p10q30"

# Spot(p15_q5) - 250 rounds, 2 local steps
generate_data 20
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 20 -jr 1.0 --on_demand_clients 15 --spot_clients 5 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e2_iid_m20_p15q5"
# Spot(p15_q10) - 250 rounds, 2 local steps
generate_data 25
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 25 -jr 1.0 --on_demand_clients 15 --spot_clients 10 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e2_iid_m20_p15q10"
# Spot(p15_q20) - 250 rounds, 2 local steps
generate_data 35
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 35 -jr 1.0 --on_demand_clients 15 --spot_clients 20 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e2_iid_m20_p15q20"
# Spot(p15_q30) - 250 rounds, 2 local steps
generate_data 45
python main.py -data Cifar100 -ncl 100 -m ResNet18 -algo FedAvg -gr 250 -ls 2 -nc 45 -jr 1.0 --on_demand_clients 15 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_ResNet18_e2_iid_m20_p15q30"

echo "All experiments completed!"
