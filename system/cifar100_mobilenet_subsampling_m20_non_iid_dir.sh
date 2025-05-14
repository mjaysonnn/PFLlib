#!/bin/bash

# Function to generate non-IID Dirichlet data for CIFAR-100
generate_noniid_data() {
    echo "Generating non-IID Dirichlet CIFAR-100 data with $1 clients..."
    cd ../dataset || exit
    rm -rf Cifar100/
    python generate_Cifar100.py noniid - dir $1
    cd ../system || exit
}

# Local Epochs = 10, Batch Size = 32, Learning Rate = 0.01

# # Pure On-Demand (20 OD)
# generate_noniid_data 100
# python main.py -data Cifar100 -ncl 100 -m MobileNet -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.2 \
# --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 \
# -go "MobileNet_cifar100_e10_dirichlet_p20q0"

# # Balanced (10 OD + 20 Spot)
# generate_noniid_data 100
# python main.py -data Cifar100 -ncl 100 -m MobileNet -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.3 \
# --on_demand_clients 10 --spot_clients 20 -lr 0.01 -lbs 32 \
# -go "MobileNet_cifar100_e10_dirichlet_p10q20"

# Intermediate 1 (8 OD + 22 Spot)
generate_noniid_data 100
python main.py -data Cifar100 -ncl 100 -m MobileNet -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.3 \
--on_demand_clients 8 --spot_clients 22 -lr 0.01 -lbs 32 \
-go "MobileNet_cifar100_e10_dirichlet_p8q22"

# Intermediate 2 (6 OD + 24 Spot)
generate_noniid_data 100
python main.py -data Cifar100 -ncl 100 -m MobileNet -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.3 \
--on_demand_clients 6 --spot_clients 24 -lr 0.01 -lbs 32 \
-go "MobileNet_cifar100_e10_dirichlet_p6q24"

# # Spot-Heavy (5 OD + 25 Spot)
# generate_noniid_data 100
# python main.py -data Cifar100 -ncl 100 -m MobileNet -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.3 \
# --on_demand_clients 5 --spot_clients 25 -lr 0.01 -lbs 32 \
# -go "MobileNet_cifar100_e10_dirichlet_p5q25"

# # Max-Spot (2 OD + 28 Spot)
# generate_noniid_data 100
# python main.py -data Cifar100 -ncl 100 -m MobileNet -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.3 \
# --on_demand_clients 2 --spot_clients 28 -lr 0.01 -lbs 32 \
# -go "MobileNet_cifar100_e10_dirichlet_p2q28"