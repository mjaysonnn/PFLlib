#!/bin/bash

# Running on Jisoo3


# Pathological Non-IID Data Generation and Experiment Scripts

# Function to generate pathological non-IID data with specified number of clients
generate_pathological_data() {
    echo "Generating pathological non-IID CIFAR-10 data with $1 clients..."
    cd ../dataset
    rm -rf Cifar10/  # Deletes the entire Cifar10 folder
    python generate_Cifar10.py noniid - pat $1
    cd ../system
}

# Experiments with 500 rounds, and 1 local step
echo "Starting pathological non-IID experiments with 500 rounds, and 1 local step"

# FedAvg - 500 rounds, 1 local step
generate_pathological_data 20
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 500 -ls 1 -nc 20 -jr 1.0 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "FedAvgCNN_e1_poisson_pathological_m20_fedavg"

# Spot(p5_q15) - 500 rounds, 1 local step
generate_pathological_data 20
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 500 -ls 1 -nc 20 -jr 1.0 --on_demand_clients 5 --spot_clients 15 -lr 0.01 -lbs 32 -go "FedAvgCNN_e1_poisson_pathological_m20_p5q15"
# Spot(p5_q20) - 500 rounds, 1 local step
generate_pathological_data 25
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 500 -ls 1 -nc 25 -jr 1.0 --on_demand_clients 5 --spot_clients 20 -lr 0.01 -lbs 32 -go "FedAvgCNN_e1_poisson_pathological_m20_p5q20"
# Spot(p5_q30) - 500 rounds, 1 local step
generate_pathological_data 35
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 500 -ls 1 -nc 35 -jr 1.0 --on_demand_clients 5 --spot_clients 30 -lr 0.01 -lbs 32 -go "FedAvgCNN_e1_poisson_pathological_m20_p5q30"
# Spot(p5_q40) - 500 rounds, 1 local step
generate_pathological_data 45
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 500 -ls 1 -nc 45 -jr 1.0 --on_demand_clients 5 --spot_clients 40 -lr 0.01 -lbs 32 -go "FedAvgCNN_e1_poisson_pathological_m20_p5q40"

# Spot(p10_q10) - 500 rounds, 1 local step
generate_pathological_data 20
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 500 -ls 1 -nc 20 -jr 1.0 --on_demand_clients 10 --spot_clients 10 -lr 0.01 -lbs 32 -go "FedAvgCNN_e1_poisson_pathological_m20_p10q10"
# Spot(p10_q20) - 500 rounds, 1 local step
generate_pathological_data 30
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 500 -ls 1 -nc 30 -jr 1.0 --on_demand_clients 10 --spot_clients 20 -lr 0.01 -lbs 32 -go "FedAvgCNN_e1_poisson_pathological_m20_p10q20"
# Spot(p10_q30) - 500 rounds, 1 local step
generate_pathological_data 40
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 500 -ls 1 -nc 40 -jr 1.0 --on_demand_clients 10 --spot_clients 30 -lr 0.01 -lbs 32 -go "FedAvgCNN_e1_poisson_pathological_m20_p10q30"

# Spot(p15_q5) - 500 rounds, 1 local step
generate_pathological_data 20
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 500 -ls 1 -nc 20 -jr 1.0 --on_demand_clients 15 --spot_clients 5 -lr 0.01 -lbs 32 -go "FedAvgCNN_e1_poisson_pathological_m20_p15q5"
# Spot(p15_q10) - 500 rounds, 1 local step
generate_pathological_data 25
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 500 -ls 1 -nc 25 -jr 1.0 --on_demand_clients 15 --spot_clients 10 -lr 0.01 -lbs 32 -go "FedAvgCNN_e1_poisson_pathological_m20_p15q10"
# Spot(p15_q20) - 500 rounds, 1 local step
generate_pathological_data 35
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 500 -ls 1 -nc 35 -jr 1.0 --on_demand_clients 15 --spot_clients 20 -lr 0.01 -lbs 32 -go "FedAvgCNN_e1_poisson_pathological_m20_p15q20"
# Spot(p15_q30) - 500 rounds, 1 local step
generate_pathological_data 45
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 500 -ls 1 -nc 45 -jr 1.0 --on_demand_clients 15 --spot_clients 30 -lr 0.01 -lbs 32 -go "FedAvgCNN_e1_poisson_pathological_m20_p15q30"

# Experiments with 250 rounds, and 2 local step
echo "Starting pathological non-IID experiments with 250 rounds, and 2 local step"

# FedAvg - 250 rounds, 2 local steps
generate_pathological_data 20
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 2 -nc 20 -jr 1.0 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "FedAvgCNN_e2_poisson_pathological_m20_fedavg"
# Spot(p5_q15) - 250 rounds, 2 local steps
generate_pathological_data 20
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 2 -nc 20 -jr 1.0 --on_demand_clients 5 --spot_clients 15 -lr 0.01 -lbs 32 -go "FedAvgCNN_e2_poisson_pathological_m20_p5q15"
# Spot(p5_q20) - 250 rounds, 2 local steps
generate_pathological_data 25
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 2 -nc 25 -jr 1.0 --on_demand_clients 5 --spot_clients 20 -lr 0.01 -lbs 32 -go "FedAvgCNN_e2_poisson_pathological_m20_p5q20"
# Spot(p5_q30) - 250 rounds, 2 local steps
generate_pathological_data 35
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 2 -nc 35 -jr 1.0 --on_demand_clients 5 --spot_clients 30 -lr 0.01 -lbs 32 -go "FedAvgCNN_e2_poisson_pathological_m20_p5q30"
# Spot(p5_q40) - 250 rounds, 2 local steps
generate_pathological_data 45
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 2 -nc 45 -jr 1.0 --on_demand_clients 5 --spot_clients 40 -lr 0.01 -lbs 32 -go "FedAvgCNN_e2_poisson_pathological_m20_p5q40"

# Spot(p10_q10) - 250 rounds, 2 local steps
generate_pathological_data 20
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 2 -nc 20 -jr 1.0 --on_demand_clients 10 --spot_clients 10 -lr 0.01 -lbs 32 -go "FedAvgCNN_e2_poisson_pathological_m20_p10q10"
# Spot(p10_q20) - 250 rounds, 2 local steps
generate_pathological_data 30
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 2 -nc 30 -jr 1.0 --on_demand_clients 10 --spot_clients 20 -lr 0.01 -lbs 32 -go "FedAvgCNN_e2_poisson_pathological_m20_p10q20"
# Spot(p10_q30) - 250 rounds, 2 local steps
generate_pathological_data 40
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 2 -nc 40 -jr 1.0 --on_demand_clients 10 --spot_clients 30 -lr 0.01 -lbs 32 -go "FedAvgCNN_e2_poisson_pathological_m20_p10q30"

# Spot(p15_q5) - 250 rounds, 2 local steps
generate_pathological_data 20
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 2 -nc 20 -jr 1.0 --on_demand_clients 15 --spot_clients 5 -lr 0.01 -lbs 32 -go "FedAvgCNN_e2_poisson_pathological_m20_p15q5"
# Spot(p15_q10) - 250 rounds, 2 local steps
generate_pathological_data 25
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 2 -nc 25 -jr 1.0 --on_demand_clients 15 --spot_clients 10 -lr 0.01 -lbs 32 -go "FedAvgCNN_e2_poisson_pathological_m20_p15q10"
# Spot(p15_q20) - 250 rounds, 2 local steps
generate_pathological_data 35
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 2 -nc 35 -jr 1.0 --on_demand_clients 15 --spot_clients 20 -lr 0.01 -lbs 32 -go "FedAvgCNN_e2_poisson_pathological_m20_p15q20"
# Spot(p15_q30) - 250 rounds, 2 local steps
generate_pathological_data 45
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 2 -nc 45 -jr 1.0 --on_demand_clients 15 --spot_clients 30 -lr 0.01 -lbs 32 -go "FedAvgCNN_e2_poisson_pathological_m20_p15q30"

echo "All pathological non-IID experiments completed!"
