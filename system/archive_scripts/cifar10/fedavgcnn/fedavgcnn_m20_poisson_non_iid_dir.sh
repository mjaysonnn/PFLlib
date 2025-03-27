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

# Experiments with 50 rounds and 10 local steps
echo "Starting non-IID experiments with 50 rounds and 10 local steps"

# FedAvg - 50 rounds, 10 local step
generate_noniid_data 20
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 50 -ls 10 -nc 20 -jr 1.0 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "CNN_e10_dirichlet_m20_fedavg"

# SCAFFOLD - 50 rounds, 10 local steps
generate_noniid_data 20
python main.py -data Cifar10 -m CNN -algo SCAFFOLD -gr 50 -ls 10 -nc 20 -jr 1.0 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "CNN_e10_dirichlet_m20_scaffold"

# Spot(p5_q15) - 50 rounds, 10 local step
generate_noniid_data 20
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 50 -ls 10 -nc 20 -jr 1.0 --on_demand_clients 5 --spot_clients 15 -lr 0.01 -lbs 32 -go "CNN_e10_dirichlet_m20_p5q15"
# Spot(p5_q20) - 50 rounds, 10 local step
generate_noniid_data 25
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 50 -ls 10 -nc 25 -jr 1.0 --on_demand_clients 5 --spot_clients 20 -lr 0.01 -lbs 32 -go "CNN_e10_dirichlet_m20_p5q20"
# Spot(p5_q30) - 50 rounds, 10 local step
generate_noniid_data 35
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 50 -ls 10 -nc 35 -jr 1.0 --on_demand_clients 5 --spot_clients 30 -lr 0.01 -lbs 32 -go "CNN_e10_dirichlet_m20_p5q30"
# Spot(p5_q40) - 50 rounds, 10 local step
generate_noniid_data 45
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 50 -ls 10 -nc 45 -jr 1.0 --on_demand_clients 5 --spot_clients 40 -lr 0.01 -lbs 32 -go "CNN_e10_dirichlet_m20_p5q40"

# Spot(p10_q10) - 50 rounds, 10 local step
generate_noniid_data 20
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 50 -ls 10 -nc 20 -jr 1.0 --on_demand_clients 10 --spot_clients 10 -lr 0.01 -lbs 32 -go "CNN_e10_dirichlet_m20_p10q10"
# Spot(p10_q20) - 50 rounds, 10 local step
generate_noniid_data 30
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 50 -ls 10 -nc 30 -jr 1.0 --on_demand_clients 10 --spot_clients 20 -lr 0.01 -lbs 32 -go "CNN_e10_dirichlet_m20_p10q20"
# Spot(p10_q30) - 50 rounds, 10 local step
generate_noniid_data 40
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 50 -ls 10 -nc 40 -jr 1.0 --on_demand_clients 10 --spot_clients 30 -lr 0.01 -lbs 32 -go "CNN_e10_dirichlet_m20_p10q30"

# Spot(p15_q5) - 50 rounds, 10 local step
generate_noniid_data 20
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 50 -ls 10 -nc 20 -jr 1.0 --on_demand_clients 15 --spot_clients 5 -lr 0.01 -lbs 32 -go "CNN_e10_dirichlet_m20_p15q5"
# Spot(p15_q10) - 50 rounds, 10 local step
generate_noniid_data 25
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 50 -ls 10 -nc 25 -jr 1.0 --on_demand_clients 15 --spot_clients 10 -lr 0.01 -lbs 32 -go "CNN_e10_dirichlet_m20_p15q10"
# Spot(p15_q20) - 50 rounds, 10 local step
generate_noniid_data 35
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 50 -ls 10 -nc 35 -jr 1.0 --on_demand_clients 15 --spot_clients 20 -lr 0.01 -lbs 32 -go "CNN_e10_dirichlet_m20_p15q20"
# Spot(p15_q30) - 50 rounds, 10 local step
generate_noniid_data 45
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 50 -ls 10 -nc 45 -jr 1.0 --on_demand_clients 15 --spot_clients 30 -lr 0.01 -lbs 32 -go "CNN_e10_dirichlet_m20_p15q30"




# Experiments with 25 rounds and 20 local steps
echo "Starting non-IID experiments with 25 rounds and 20 local steps"

# FedAvg - 25 rounds, 20 local steps
generate_noniid_data 20
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 25 -ls 20 -nc 20 -jr 1.0 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "CNN_e20_dirichlet_m20_fedavg"

# SCAFFOLD - 25 rounds, 20 local steps
generate_noniid_data 20
python main.py -data Cifar10 -m CNN -algo SCAFFOLD -gr 25 -ls 20 -nc 20 -jr 1.0 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "CNN_e20_dirichlet_m20_scaffold"

# Spot(p5_q15) - 25 rounds, 20 local steps
generate_noniid_data 20
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 25 -ls 20 -nc 20 -jr 1.0 --on_demand_clients 5 --spot_clients 15 -lr 0.01 -lbs 32 -go "CNN_e20_dirichlet_m20_p5q15"
# Spot(p5_q20) - 25 rounds, 20 local steps
generate_noniid_data 25
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 25 -ls 20 -nc 25 -jr 1.0 --on_demand_clients 5 --spot_clients 20 -lr 0.01 -lbs 32 -go "CNN_e20_dirichlet_m20_p5q20"
# Spot(p5_q30) - 25 rounds, 20 local steps
generate_noniid_data 35
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 25 -ls 20 -nc 35 -jr 1.0 --on_demand_clients 5 --spot_clients 30 -lr 0.01 -lbs 32 -go "CNN_e20_dirichlet_m20_p5q30"
# Spot(p5_q40) - 25 rounds, 20 local steps
generate_noniid_data 45
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 25 -ls 20 -nc 45 -jr 1.0 --on_demand_clients 5 --spot_clients 40 -lr 0.01 -lbs 32 -go "CNN_e20_dirichlet_m20_p5q40"

# Spot(p10_q10) - 25 rounds, 20 local steps
generate_noniid_data 20
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 25 -ls 20 -nc 20 -jr 1.0 --on_demand_clients 10 --spot_clients 10 -lr 0.01 -lbs 32 -go "CNN_e20_dirichlet_m20_p10q10"
# Spot(p10_q20) - 25 rounds, 20 local steps
generate_noniid_data 30
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 25 -ls 20 -nc 30 -jr 1.0 --on_demand_clients 10 --spot_clients 20 -lr 0.01 -lbs 32 -go "CNN_e20_dirichlet_m20_p10q20"
# Spot(p10_q30) - 25 rounds, 20 local steps
generate_noniid_data 40
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 25 -ls 20 -nc 40 -jr 1.0 --on_demand_clients 10 --spot_clients 30 -lr 0.01 -lbs 32 -go "CNN_e20_dirichlet_m20_p10q30"

# Spot(p15_q5) - 25 rounds, 20 local steps
generate_noniid_data 20
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 25 -ls 20 -nc 20 -jr 1.0 --on_demand_clients 15 --spot_clients 5 -lr 0.01 -lbs 32 -go "CNN_e20_dirichlet_m20_p15q5"
# Spot(p15_q10) - 25 rounds, 20 local steps
generate_noniid_data 25
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 25 -ls 20 -nc 25 -jr 1.0 --on_demand_clients 15 --spot_clients 10 -lr 0.01 -lbs 32 -go "CNN_e20_dirichlet_m20_p15q10"
# Spot(p15_q20) - 25 rounds, 20 local steps
generate_noniid_data 35
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 25 -ls 20 -nc 35 -jr 1.0 --on_demand_clients 15 --spot_clients 20 -lr 0.01 -lbs 32 -go "CNN_e20_dirichlet_m20_p15q20"

# Spot(p15_q30) - 25 rounds, 20 local steps
generate_noniid_data 45
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 25 -ls 20 -nc 45 -jr 1.0 --on_demand_clients 15 --spot_clients 30 -lr 0.01 -lbs 32 -go "CNN_e20_dirichlet_m20_p15q30"

echo "All non-IID experiments completed!"
