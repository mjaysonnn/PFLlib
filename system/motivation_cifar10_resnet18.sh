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

# Dataset: Cifar100, Model: ResNet

# 20 On-Demand + 0 Spot (p20q0) 
generate_noniid_data Cifar10 20
python main.py \
  -data Cifar10 \
  -ncl 10 \
  -m ResNet18 \
  -algo FedAvg \
  -gr 1000 \
  -ls 1 \
  -nc 20 \
  -jr 1.0 \
  --on_demand_clients 20 \
  --spot_clients 0 \
  -lr 0.01 \
  -lbs 128 \
  -go "ResNet_cifar10_dirichlet_r1000_m20_p20q0"

# 20 Spot + 0 On-Demand (p0q20)
generate_noniid_data Cifar10 20
python main.py \
  -data Cifar10 \
  -ncl 10 \
  -m ResNet18 \
  -algo FedAvg \
  -gr 1000 \
  -ls 1 \
  -nc 20 \
  -jr 1.0 \
  --on_demand_clients 0 \
  --spot_clients 20 \
  -lr 0.01 \
  -lbs 128 \
  -go "ResNet_cifar10_dirichlet_r1000_m20_p0q20"


# 10 On-Demand + 20 Spot (p10q20)
generate_noniid_data Cifar10 30
python main.py \
  -data Cifar10 \
  -ncl 10 \
  -m ResNet18 \
  -algo FedAvg \
  -gr 1000 \
  -ls 1 \
  -nc 30 \
  -jr 1.0 \
  --on_demand_clients 10 \
  --spot_clients 20 \
  -lr 0.01 \
  -lbs 128 \
  -go "ResNet_cifar10_dirichlet_r1000_m30_p10q20"


# 5 On-Demand + 30 Spot (p5q30)
generate_noniid_data Cifar10 35
python main.py \
  -data Cifar10 \
  -ncl 10 \
  -m ResNet18 \
  -algo FedAvg \
  -gr 1000 \
  -ls 1 \
  -nc 35 \
  -jr 1.0 \
  --on_demand_clients 5 \
  --spot_clients 30 \
  -lr 0.01 \
  -lbs 128 \
  -go "ResNet_cifar10_dirichlet_r1000_m35_p5q30"