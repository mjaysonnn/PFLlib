#!/bin/bash

# Function to generate non-IID Dirichlet data for a given dataset and client count
generate_noniid_data() {
    DATASET=$1        # e.g., Cifar100
    NUM_CLIENTS=$2    # e.g., 100

    echo "Generating non-IID Dirichlet $DATASET data with $NUM_CLIENTS clients..."
    cd ../dataset || exit
    rm -rf $DATASET/  # Delete existing dataset folder
    python generate_${DATASET}.py noniid - dir $NUM_CLIENTS
    cd ../system || exit
}

# Dataset: Cifar100, Model: MobileNet, Distribution: Dirichlet, Local Epochs: 1

# Pure On-Demand (20 clients) - Jisoo1
# generate_noniid_data Cifar100 100
# python main.py -data Cifar100 -ncl 100 -m MobileNet -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "MobileNet_cifar100_e1_dirichlet_m20_fedavg"

# # 10 On-Demand + 20 Spot (p10q20) - Jisoo2
# generate_noniid_data Cifar100 100
# python main.py -data Cifar100 -ncl 100 -m MobileNet -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.3 --on_demand_clients 10 --spot_clients 20 -lr 0.01 -lbs 32 -go "MobileNet_cifar100_e1_dirichlet_m20_p10q20"

# # 15 On-Demand + 10 Spot (p15q10) - Jisoo3
# generate_noniid_data Cifar100 100
# python main.py -data Cifar100 -ncl 100 -m MobileNet -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.25 --on_demand_clients 15 --spot_clients 10 -lr 0.01 -lbs 32 -go "MobileNet_cifar100_e1_dirichlet_m20_p15q10"

# # 16 On-Demand + 8 Spot (p16q8) - Jisoo4
# generate_noniid_data Cifar100 100
# python main.py -data Cifar100 -ncl 100 -m MobileNet -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.24 --on_demand_clients 16 --spot_clients 8 -lr 0.01 -lbs 32 -go "MobileNet_cifar100_e1_dirichlet_m20_p16q8"

# # 17 On-Demand + 6 Spot (p17q6) - Jisoo5
generate_noniid_data Cifar100 100
python main.py -data Cifar100 -ncl 100 -m MobileNet -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.23 --on_demand_clients 17 --spot_clients 6 -lr 0.01 -lbs 32 -go "MobileNet_cifar100_e1_dirichlet_m20_p17q6"

# # 18 On-Demand + 4 Spot (p18q4)
# generate_noniid_data Cifar100 100
# python main.py -data Cifar100 -ncl 100 -m MobileNet -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.22 --on_demand_clients 18 --spot_clients 4 -lr 0.01 -lbs 32 -go "MobileNet_cifar100_e1_dirichlet_m20_p18q4"