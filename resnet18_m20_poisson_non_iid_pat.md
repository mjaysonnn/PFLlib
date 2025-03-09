Here's the updated version of the script:

## Data Generation

Run the following commands to generate the dataset before running experiments:

```bash
cd ../dataset
python generate_Cifar10.py noniid - pat
cd ../system
```

## Experiment Setup Table

| Global Rounds | Local Steps | Algorithm |
|--------------|-------------|-----------|
| 2500 | 1 | FedAvg | `Jisoo5` |
| 2500 | 1 | Spot(p5_q20) |
| 2500 | 1 | Spot(p5_q30) |
| 2500 | 1 | Spot(p5_q40) |
| 2500 | 1 | Spot(p10_q10) |
| 2500 | 1 | Spot(p10_q20) |
| 2500 | 1 | Spot(p10_q30) |
| 2500 | 1 | Spot(p15_q10) |
| 2500 | 1 | Spot(p15_q20) |
| 2500 | 1 | Spot(p15_q30) |

| Global Rounds | Local Steps | Algorithm |
|--------------|-------------|-----------|
| 1250 | 2 | FedAvg | `View1` |
| 1250 | 2 | Spot(p5_q20) |
| 1250 | 2 | Spot(p5_q30) |
| 1250 | 2 | Spot(p5_q40) |
| 1250 | 2 | Spot(p10_q10) |
| 1250 | 2 | Spot(p10_q20) |
| 1250 | 2 | Spot(p10_q30) |
| 1250 | 2 | Spot(p15_q10) |
| 1250 | 2 | Spot(p15_q20) |
| 1250 | 2 | Spot(p15_q30) |


### -gr 2500 (Local Steps: -ls 1)

```bash
# FedAvg - 2500 rounds, 1 local step
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 20 -jr 1.0 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_pathological_m20_fedavg"

# Spot(p5_q20) - 2500 rounds, 1 local step
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 25 -jr 1.0 --on_demand_clients 5 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_pathological_m20_p5q20"

# Spot(p5_q30) - 2500 rounds, 1 local step
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 35 -jr 1.0 --on_demand_clients 5 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_pathological_m20_p5q30"

# Spot(p5_q40) - 2500 rounds, 1 local step
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 45 -jr 1.0 --on_demand_clients 5 --spot_clients 40 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_pathological_m20_p5q40"

# Spot(p10_q10) - 2500 rounds, 1 local step
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 20 -jr 1.0 --on_demand_clients 10 --spot_clients 10 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_pathological_m20_p10q10"

# Spot(p10_q20) - 2500 rounds, 1 local step
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 30 -jr 1.0 --on_demand_clients 10 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_pathological_m20_p10q20"

# Spot(p10_q30) - 2500 rounds, 1 local step
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 40 -jr 1.0 --on_demand_clients 10 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_pathological_m20_p10q30"

# Spot(p15_q10) - 2500 rounds, 1 local step
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 25 -jr 1.0 --on_demand_clients 15 --spot_clients 10 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_pathological_m20_p15q10"

# Spot(p15_q20) - 2500 rounds, 1 local step
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 35 -jr 1.0 --on_demand_clients 15 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_pathological_m20_p15q20"

# Spot(p15_q30) - 2500 rounds, 1 local step
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 45 -jr 1.0 --on_demand_clients 15 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_pathological_m20_p15q30"

```



```bash
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 20 -jr 1.0 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_pathological_m20_fedavg" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 25 -jr 1.0 --on_demand_clients 5 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_pathological_m20_p5q20" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 35 -jr 1.0 --on_demand_clients 5 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_pathological_m20_p5q30" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 45 -jr 1.0 --on_demand_clients 5 --spot_clients 40 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_pathological_m20_p5q40" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 20 -jr 1.0 --on_demand_clients 10 --spot_clients 10 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_pathological_m20_p10q10" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 30 -jr 1.0 --on_demand_clients 10 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_pathological_m20_p10q20" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 40 -jr 1.0 --on_demand_clients 10 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_pathological_m20_p10q30" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 25 -jr 1.0 --on_demand_clients 15 --spot_clients 10 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_pathological_m20_p15q10" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 35 -jr 1.0 --on_demand_clients 15 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_pathological_m20_p15q20" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 45 -jr 1.0 --on_demand_clients 15 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e1_poisson_pathological_m20_p15q30" 
```

## -gr 1250 (Local Steps: -ls 2)

```bash
# FedAvg - 1250 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 20 -jr 1.0 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_pathological_m20_fedavg"

# Spot(p5_q20) - 1250 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 25 -jr 1.0 --on_demand_clients 5 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_pathological_m20_p5q20"

# Spot(p5_q30) - 1250 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 35 -jr 1.0 --on_demand_clients 5 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_pathological_m20_p5q30"

# Spot(p5_q40) - 1250 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 45 -jr 1.0 --on_demand_clients 5 --spot_clients 40 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_pathological_m20_p5q40"

# Spot(p10_q10) - 1250 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 20 -jr 1.0 --on_demand_clients 10 --spot_clients 10 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_pathological_m20_p10q10"

# Spot(p10_q20) - 1250 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 30 -jr 1.0 --on_demand_clients 10 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_pathological_m20_p10q20"

# Spot(p10_q30) - 1250 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 40 -jr 1.0 --on_demand_clients 10 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_pathological_m20_p10q30"

# Spot(p15_q10) - 1250 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 25 -jr 1.0 --on_demand_clients 15 --spot_clients 10 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_pathological_m20_p15q10"

# Spot(p15_q20) - 1250 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 35 -jr 1.0 --on_demand_clients 15 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_pathological_m20_p15q20"

# Spot(p15_q30) - 1250 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 45 -jr 1.0 --on_demand_clients 15 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_pathological_m20_p15q30"
```

```bash
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 20 -jr 1.0 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_pathological_m20_fedavg" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 25 -jr 1.0 --on_demand_clients 5 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_pathological_m20_p5q20" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 35 -jr 1.0 --on_demand_clients 5 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_pathological_m20_p5q30" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 45 -jr 1.0 --on_demand_clients 5 --spot_clients 40 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_pathological_m20_p5q40" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 20 -jr 1.0 --on_demand_clients 10 --spot_clients 10 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_pathological_m20_p10q10" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 30 -jr 1.0 --on_demand_clients 10 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_pathological_m20_p10q20" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 40 -jr 1.0 --on_demand_clients 10 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_pathological_m20_p10q30" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 25 -jr 1.0 --on_demand_clients 15 --spot_clients 10 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_pathological_m20_p15q10" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 35 -jr 1.0 --on_demand_clients 15 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_pathological_m20_p15q20" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 45 -jr 1.0 --on_demand_clients 15 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e2_poisson_pathological_m20_p15q30"

```