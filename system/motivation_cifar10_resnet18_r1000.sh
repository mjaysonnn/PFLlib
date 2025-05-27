#!/bin/bash
set -e  # Exit on any error

# Global variables
DATASET="Cifar10"
MODEL="ResNet18"
NUM_CLASSES=10

# Function to generate non-IID Dirichlet data for a given dataset and client count
generate_noniid_data() {
    local dataset=$1
    local num_clients=$2

    echo "Generating non-IID Dirichlet ${dataset} data with ${num_clients} clients..."
    cd ../dataset || exit
    rm -rf "${dataset}/"  # Delete existing dataset folder
    python generate_${dataset}.py noniid - dir "${num_clients}"
    cd ../system || exit
}

# Function to run experiment
run_experiment() {
    local num_clients=$1
    local on_demand=$2
    local spot=$3
    local run_name=$4

    echo "Running experiment: ${run_name}"
    python3 main.py \
        -data "${DATASET}" \
        -ncl "${NUM_CLASSES}" \
        -m "${MODEL}" \
        -algo FedAvg \
        -gr 1000 \
        -ls 1 \
        -nc "${num_clients}" \
        -jr 1.0 \
        --on_demand_clients "${on_demand}" \
        --spot_clients "${spot}" \
        -lr 0.01 \
        -lbs 128 \
        -go "${run_name}"
}

# -----------------------------
# Experiments with configurations
# -----------------------------

# 20 On-Demand + 0 Spot (p20q0)
generate_noniid_data "${DATASET}" 20
run_experiment 20 20 0 "${MODEL}_dirichlet_r1000_b1_p20q0"

# 0 On-Demand + 20 Spot (p0q20)
# generate_noniid_data "${DATASET}" 20
# run_experiment 20 0 20 "${MODEL}_cifar10_dirichlet_r1000_m20_b1_p0q20"

# 0 On-Demand + 40 Spot (p0q40)
generate_noniid_data "${DATASET}" 40
run_experiment 40 0 40 "${MODEL}_dirichlet_r1000_b1_p0q40"

# 5 On-Demand + 30 Spot (p5q30)
generate_noniid_data "${DATASET}" 35
run_experiment 35 5 30 "${MODEL}_dirichlet_r1000_b1_p5q30"

# 10 On-Demand + 20 Spot (p10q20)
generate_noniid_data "${DATASET}" 30
run_experiment 30 10 20 "${MODEL}_dirichlet_r1000_b1_p10q20"

# 15 On-Demand + 10 Spot (p15q10)
generate_noniid_data "${DATASET}" 25
run_experiment 25 15 10 "${MODEL}_dirichlet_r1000_b1_p15q10"