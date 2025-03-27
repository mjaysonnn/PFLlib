#!/bin/bash

# Non-IID (Dirichlet) Data Generation and Experiment Scripts

# Function to generate non-IID data with specified number of clients
generate_noniid_data() {
    echo "Generating non-IID (Dirichlet) CIFAR-10 data with $1 clients..."
    cd ../dataset || exit
    rm -rf Cifar100/  # Deletes the entire Cifar10 folder
    python generate_Cifar100.py noniid - dir $1
    cd ../system || exit
}

# Experiments with 50 rounds and 10 local steps
echo "Starting non-IID (Dirichlet) experiments with 50 rounds and 10 local steps"

# FedAvg - 50 rounds, 10 local steps
generate_noniid_data 50
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 50 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e10_dirichlet_m50_fedavg"

# SCAFFOLD - 50 rounds, 10 local steps
generate_noniid_data 50
python main.py -data Cifar100 -ncl 100-m CNN -algo SCAFFOLD -gr 50 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e10_dirichlet_m50_scaffold"

# Spot(p10_q40) - 50 rounds, 10 local steps
generate_noniid_data 50
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 50 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 10 --spot_clients 40 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e10_dirichlet_m50_p10q40"

# Spot(p10_q50) - 50 rounds, 10 local steps
generate_noniid_data 60
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 50 -ls 10 -nc 60 -jr 1.0 --on_demand_clients 10 --spot_clients 50 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e10_dirichlet_m50_p10q50"

# Spot(p10_q60) - 50 rounds, 10 local steps
generate_noniid_data 70
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 50 -ls 10 -nc 70 -jr 1.0 --on_demand_clients 10 --spot_clients 60 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e10_dirichlet_m50_p10q60"

# Spot(p10_q70) - 50 rounds, 10 local steps
generate_noniid_data 80
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 50 -ls 10 -nc 80 -jr 1.0 --on_demand_clients 10 --spot_clients 70 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e10_dirichlet_m50_p10q70"

# Spot(p10_q80) - 50 rounds, 10 local steps
generate_noniid_data 90
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 50 -ls 10 -nc 90 -jr 1.0 --on_demand_clients 10 --spot_clients 80 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e10_dirichlet_m50_p10q80"

# Spot(p20_q30) - 50 rounds, 10 local steps
generate_noniid_data 50
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 50 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 20 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e10_dirichlet_m50_p20q30"

# Spot(p20_q40) - 50 rounds, 10 local steps
generate_noniid_data 60
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 50 -ls 10 -nc 60 -jr 1.0 --on_demand_clients 20 --spot_clients 40 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e10_dirichlet_m50_p20q40"

# Spot(p20_q50) - 50 rounds, 10 local steps
generate_noniid_data 70
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 50 -ls 10 -nc 70 -jr 1.0 --on_demand_clients 20 --spot_clients 50 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e10_dirichlet_m50_p20q50"

# Spot(p20_q60) - 50 rounds, 10 local steps
generate_noniid_data 80
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 50 -ls 10 -nc 80 -jr 1.0 --on_demand_clients 20 --spot_clients 60 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e10_dirichlet_m50_p20q60"

# Spot(p20_q70) - 50 rounds, 10 local steps
generate_noniid_data 90
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 50 -ls 10 -nc 90 -jr 1.0 --on_demand_clients 20 --spot_clients 70 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e10_dirichlet_m50_p20q70"

# Spot(p30_q20) - 50 rounds, 10 local steps
generate_noniid_data 50
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 50 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 30 --spot_clients 20 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e10_dirichlet_m50_p30q20"

# Spot(p30_q30) - 50 rounds, 10 local steps
generate_noniid_data 60
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 50 -ls 10 -nc 60 -jr 1.0 --on_demand_clients 30 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e10_dirichlet_m50_p30q30"

# Spot(p30_q40) - 50 rounds, 10 local steps
generate_noniid_data 70
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 50 -ls 10 -nc 70 -jr 1.0 --on_demand_clients 30 --spot_clients 40 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e10_dirichlet_m50_p30q40"

# Spot(p30_q50) - 50 rounds, 10 local steps
generate_noniid_data 80
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 50 -ls 10 -nc 80 -jr 1.0 --on_demand_clients 30 --spot_clients 50 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e10_dirichlet_m50_p30q50"

# Spot(p40_q10) - 50 rounds, 10 local steps
generate_noniid_data 50
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 50 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 40 --spot_clients 10 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e10_dirichlet_m50_p40q10"

# Spot(p40_q20) - 50 rounds, 10 local steps
generate_noniid_data 60
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 50 -ls 10 -nc 60 -jr 1.0 --on_demand_clients 40 --spot_clients 20 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e10_dirichlet_m50_p40q20"

# Spot(p40_q30) - 50 rounds, 10 local steps
generate_noniid_data 70
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 50 -ls 10 -nc 70 -jr 1.0 --on_demand_clients 40 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e10_dirichlet_m50_p40q30"





# Experiments with 25 rounds and 20 local steps
echo "Starting non-IID (Dirichlet) experiments with 25 rounds and 20 local steps"

# FedAvg - 25 rounds, 20 local steps
generate_noniid_data 50
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 25 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e20_dirichlet_m50_fedavg"

# SCAFFOLD - 25 rounds, 20 local steps
generate_noniid_data 50
python main.py -data Cifar100 -ncl 100-m CNN -algo SCAFFOLD -gr 25 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e20_dirichlet_m50_scaffold"

# Spot(p10_q40) - 25 rounds, 20 local steps
generate_noniid_data 50
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 25 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 10 --spot_clients 40 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e20_dirichlet_m50_p10q40"

# Spot(p10_q50) - 25 rounds, 20 local steps
generate_noniid_data 60
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 25 -ls 20 -nc 60 -jr 1.0 --on_demand_clients 10 --spot_clients 50 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e20_dirichlet_m50_p10q50"

# Spot(p10_q60) - 25 rounds, 20 local steps
generate_noniid_data 70
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 25 -ls 20 -nc 70 -jr 1.0 --on_demand_clients 10 --spot_clients 60 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e20_dirichlet_m50_p10q60"

# Spot(p10_q70) - 25 rounds, 20 local steps
generate_noniid_data 80
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 25 -ls 20 -nc 80 -jr 1.0 --on_demand_clients 10 --spot_clients 70 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e20_dirichlet_m50_p10q70"

# Spot(p10_q80) - 25 rounds, 20 local steps
generate_noniid_data 90
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 25 -ls 20 -nc 90 -jr 1.0 --on_demand_clients 10 --spot_clients 80 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e20_dirichlet_m50_p10q80"

# Spot(p20_q30) - 25 rounds, 20 local steps
generate_noniid_data 50
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 25 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 20 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e20_dirichlet_m50_p20q30"

# Spot(p20_q40) - 25 rounds, 20 local steps
generate_noniid_data 60
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 25 -ls 20 -nc 60 -jr 1.0 --on_demand_clients 20 --spot_clients 40 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e20_dirichlet_m50_p20q40"

# Spot(p20_q50) - 25 rounds, 20 local steps
generate_noniid_data 70
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 25 -ls 20 -nc 70 -jr 1.0 --on_demand_clients 20 --spot_clients 50 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e20_dirichlet_m50_p20q50"

# Spot(p20_q60) - 25 rounds, 20 local steps
generate_noniid_data 80
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 25 -ls 20 -nc 80 -jr 1.0 --on_demand_clients 20 --spot_clients 60 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e20_dirichlet_m50_p20q60"

# Spot(p20_q70) - 25 rounds, 20 local steps
generate_noniid_data 90
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 25 -ls 20 -nc 90 -jr 1.0 --on_demand_clients 20 --spot_clients 70 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e20_dirichlet_m50_p20q70"

# Spot(p30_q20) - 25 rounds, 20 local steps
generate_noniid_data 50
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 25 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 30 --spot_clients 20 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e20_dirichlet_m50_p30q20"

# Spot(p30_q30) - 25 rounds, 20 local steps
generate_noniid_data 60
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 25 -ls 20 -nc 60 -jr 1.0 --on_demand_clients 30 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e20_dirichlet_m50_p30q30"

# Spot(p30_q40) - 25 rounds, 20 local steps
generate_noniid_data 70
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 25 -ls 20 -nc 70 -jr 1.0 --on_demand_clients 30 --spot_clients 40 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e20_dirichlet_m50_p30q40"

# Spot(p30_q50) - 25 rounds, 20 local steps
generate_noniid_data 80
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 25 -ls 20 -nc 80 -jr 1.0 --on_demand_clients 30 --spot_clients 50 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e20_dirichlet_m50_p30q50"

# Spot(p40_q10) - 25 rounds, 20 local steps
generate_noniid_data 50
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 25 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 40 --spot_clients 10 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e20_dirichlet_m50_p40q10"

# Spot(p40_q20) - 25 rounds, 20 local steps
generate_noniid_data 60
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 25 -ls 20 -nc 60 -jr 1.0 --on_demand_clients 40 --spot_clients 20 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e20_dirichlet_m50_p40q20"

# Spot(p40_q30) - 25 rounds, 20 local steps
generate_noniid_data 70
python main.py -data Cifar100 -ncl 100-m CNN -algo FedAvg -gr 25 -ls 20 -nc 70 -jr 1.0 --on_demand_clients 40 --spot_clients 30 -lr 0.01 -lbs 32 -go "Cifar100_CNN_e20_dirichlet_m50_p40q30"

echo "All non-IID (Dirichlet) experiments completed!"