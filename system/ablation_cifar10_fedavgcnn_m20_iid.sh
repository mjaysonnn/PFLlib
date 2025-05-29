#!/bin/bash
set -e  # Exit on any error

# Global variables
DATASET="Cifar10"
MODEL="CNN"

# IID Data Generation and Experiment Scripts

# Function to generate data with specified number of clients
generate_data() {
    echo "Generating IID ${DATASET} data with $1 clients..."
    cd ../dataset || exit
    rm -rf "${DATASET}/"  # Deletes the dataset folder
    python generate_${DATASET}.py iid balance - "$1"
    cd ../system || exit
}

# Function to run experiment
run_experiment() {
    echo "Running experiment: $4"
    python main.py \
        -data "${DATASET}" \
        -m "${MODEL}" \
        -algo FedAvg \
        -gr 1000 \
        -ls 1 \
        -nc "$1" \
        -jr 1.0 \
        --on_demand_clients "$2" \
        --spot_clients "$3" \
        -lr 0.01 \
        -lbs 32 \
        -go "$4"
}


# FedAvg - baseline
# generate_data 20
# run_experiment 20 20 0 "${MODEL}_b1_iid_poisson_m20_fedavg"

# # Spot(p5_q15)
# generate_data 20
# run_experiment 20 5 15 "${MODEL}_e1_iid_poisson_m20_p5q15"

# # Spot(p5_q20)
# generate_data 25
# run_experiment 25 5 20 "${MODEL}_e1_iid_poisson_m20_p5q20"

# # Spot(p5_q30)
# generate_data 35
# run_experiment 35 5 30 "${MODEL}_e1_iid_poisson_m20_p5q30"

# # Spot(p5_q40)
# generate_data 45
# run_experiment 45 5 40 "${MODEL}_e1_iid_poisson_m20_p5q40"

# # Spot(p10_q10)
# generate_data 20
# run_experiment 20 10 10 "${MODEL}_e1_iid_poisson_m20_p10q10"

# Spot(p10_q20)
generate_data 30
run_experiment 30 10 20 "${MODEL}_e1_iid_poisson_m20_p10q20"

# Spot(p10_q30)
generate_data 40
run_experiment 40 10 30 "${MODEL}_e1_iid_poisson_m20_p10q30"

# Spot(p15_q5)
generate_data 20
run_experiment 20 15 5 "${MODEL}_e1_iid_poisson_m20_p15q5"

# Spot(p15_q10)
generate_data 25
run_experiment 25 15 10 "${MODEL}_e1_iid_poisson_m20_p15q10"

# Spot(p15_q20)
generate_data 35
run_experiment 35 15 20 "${MODEL}_e1_iid_poisson_m20_p15q20"

# Spot(p15_q30)
generate_data 45
run_experiment 45 15 30 "${MODEL}_e1_iid_poisson_m20_p15q30"