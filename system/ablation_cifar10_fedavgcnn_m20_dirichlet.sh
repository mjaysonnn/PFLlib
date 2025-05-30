#!/bin/bash
set -e  # Exit on any error

# Detect script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Global variables
DATASET=${1:-Cifar10}         # Default to Cifar10 if not provided
MODEL="CNN"
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
    "20 20 0 fedavg"
    "20 5 15 p5q15"
    "25 5 20 p5q20"
    "35 5 30 p5q30"
    "45 5 40 p5q40"
    "20 10 10 p10q10"
    "30 10 20 p10q20"
    "40 10 30 p10q30"
    "20 15 5 p15q5"
    "25 15 10 p15q10"
    "35 15 20 p15q20"
    "45 15 30 p15q30"
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