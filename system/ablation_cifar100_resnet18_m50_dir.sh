#!/bin/bash
set -e  # Exit on any error

# Detect script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Global variables
DATASET=${1:-Cifar100}         # Default to Cifar10 if not provided
MODEL="ResNet18"
PARTITION_TYPE="dir"          # Dirichlet partitioning

# Validate dataset choice
if [[ "$DATASET" != "Cifar10" && "$DATASET" != "Cifar100" ]]; then
    echo "Unsupported dataset: $DATASET"
    exit 1
fi

# Function to generate non-IID Dirichlet data with specified number of clients
generate_data() {
    echo "Generating non-IID ${PARTITION_TYPE} ${DATASET} data with $1 clients..."
    cd "$SCRIPT_DIR/../dataset" || exit
    rm -rf "${DATASET}/"  # Deletes the dataset folder
    python "generate_${DATASET}.py" noniid - "${PARTITION_TYPE}" "$1"
    cd "$SCRIPT_DIR/../system" || exit
}

# Function to run experiment
run_experiment() {
    echo "Running experiment: $4"
    python main.py \
        -data "${DATASET}" \
        -m "${MODEL}" \
        -ncl 100 \
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

# Define experiments: format "nc on_demand spot name_suffix"
EXPERIMENTS=(
    "50 50 0 fedavg"
    "50 10 40 p10q40"
    "60 10 50 p10q50"
    "70 10 60 p10q60"
    "80 10 70 p10q70"
    "90 10 80 p10q80"
    "50 20 30 p20q30"
    "60 20 40 p20q40"
    "70 20 50 p20q50"
    "80 20 60 p20q60"
    "90 20 70 p20q70"
    "50 30 20 p30q20"
    "60 30 30 p30q30"
    "70 30 40 p30q40"
    "80 30 50 p30q50"
    "50 40 10 p40q10"
    "60 40 20 p40q20"
    "70 40 30 p40q30"
)

echo "Starting Dirichlet experiments with dataset: ${DATASET}, model: ${MODEL}, 1000 rounds, 1 local step"

for EXP in "${EXPERIMENTS[@]}"; do
    set -- $EXP  # splits into $1 $2 $3 $4
    NC=$1
    ON_DEMAND=$2
    SPOT=$3
    NAME="${MODEL}_b1_${PARTITION_TYPE}_m${NC}_${4}"

    generate_data "$NC"
    run_experiment "$NC" "$ON_DEMAND" "$SPOT" "$NAME"
done