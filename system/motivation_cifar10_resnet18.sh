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

# Dataset: Cifar10, Model: ResNet

# 20 On-Demand + 0 Spot (p20q0) 
generate_noniid_data Cifar10 20
python main.py \
  -data Cifar10 \
  -ncl 10 \
  -m ResNet18 \
  -algo FedAvg \
  -gr 2000 \
  -ls 1 \
  -nc 20 \
  -jr 1.0 \
  --on_demand_clients 20 \
  --spot_clients 0 \
  -lr 0.01 \
  -lbs 128 \
  -go "ResNet_cifar10_dirichlet_r2000_m20_b1_p20q0"

# 0 On-Demand + 20 Spot (p0q20)
generate_noniid_data Cifar10 20
python main.py \
  -data Cifar10 \
  -ncl 10 \
  -m ResNet18 \
  -algo FedAvg \
  -gr 2000 \
  -ls 1 \
  -nc 20 \
  -jr 1.0 \
  --on_demand_clients 0 \
  --spot_clients 20 \
  -lr 0.01 \
  -lbs 128 \
  -go "ResNet_cifar10_dirichlet_r2000_m20_b1_p0q20"

# 0 On-Demand + 40 Spot (p0q40)
generate_noniid_data Cifar10 40
python main.py \
  -data Cifar10 \
  -ncl 10 \
  -m ResNet18 \
  -algo FedAvg \
  -gr 2000 \
  -ls 1 \
  -nc 40 \
  -jr 1.0 \
  --on_demand_clients 0 \
  --spot_clients 40 \
  -lr 0.01 \
  -lbs 128 \
  -go "ResNet_cifar10_dirichlet_r2000_m40_b1_p0q40"



# 5 On-Demand + 30 Spot (p5q30)
generate_noniid_data Cifar10 35
python main.py \
  -data Cifar10 \
  -ncl 10 \
  -m ResNet18 \
  -algo FedAvg \
  -gr 2000 \
  -ls 1 \
  -nc 35 \
  -jr 1.0 \
  --on_demand_clients 5 \
  --spot_clients 30 \
  -lr 0.01 \
  -lbs 128 \
  -go "ResNet_cifar10_dirichlet_r2000_m35_b1_p5q30"

  
# 10 On-Demand + 20 Spot (p10q20)
generate_noniid_data Cifar10 30
python main.py \
  -data Cifar10 \
  -ncl 10 \
  -m ResNet18 \
  -algo FedAvg \
  -gr 2000 \
  -ls 1 \
  -nc 30 \
  -jr 1.0 \
  --on_demand_clients 10 \
  --spot_clients 20 \
  -lr 0.01 \
  -lbs 128 \
  -go "ResNet_cifar10_dirichlet_r2000_m30_b1_p10q20"


# 15 On-Demand + 10 Spot (p15q10)
generate_noniid_data Cifar10 25
python main.py \
  -data Cifar10 \
  -ncl 10 \
  -m ResNet18 \
  -algo FedAvg \
  -gr 2000 \
  -ls 1 \
  -nc 25 \
  -jr 1.0 \
  --on_demand_clients 15 \
  --spot_clients 10 \
  -lr 0.01 \
  -lbs 128 \
  -go "ResNet_cifar10_dirichlet_r2000_m25_b1_p15q10"
