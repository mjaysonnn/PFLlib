# IID Data Generation and Experiment Scripts

## Data Generation

```shell
cd ../dataset
python generate_Cifar10.py noniid - pat
cd ../system
```

## Experiment Setup Table

| Global Rounds | Local Steps | Algorithm |
|--------------|-------------|-----------|

| 2500 | 1 | Spot(p5_q15) |
| 2500 | 1 | Spot(p15_q5) |

| Global Rounds | Local Steps | Algorithm |
|--------------|-------------|-----------|

| 1250 | 2 | Spot(p5_q15) |
| 1250 | 2 | Spot(p15_q5) |



### -gr 2500 (Local Steps: -ls 1)

```bash

# Spot(p5_q15) - 2500 rounds, 1 local step
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 20 -jr 1.0 --on_demand_clients 5 --spot_clients 15 -lr 0.01 -lbs 32 -go "ResNet18_e1_pathological_poisson_m20_p5q15"

# Spot(p15_q5) - 2500 rounds, 1 local step
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 20 -jr 1.0 --on_demand_clients 15 --spot_clients 5 -lr 0.01 -lbs 32 -go "ResNet18_e1_pathological_poisson_m20_p15q5"

```


## -gr 1250 (Local Steps: -ls 2)

```bash
# Spot(p5_q15) - 1250 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 20 -jr 1.0 --on_demand_clients 5 --spot_clients 15 -lr 0.01 -lbs 32 -go "ResNet18_e2_pathological_poisson_m20_p5q15"

# Spot(p15_q5) - 1250 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 20 -jr 1.0 --on_demand_clients 15 --spot_clients 5 -lr 0.01 -lbs 32 -go "ResNet18_e2_pathological_poisson_m20_p15q5"
```

```bash
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 20 -jr 1.0 --on_demand_clients 5 --spot_clients 15 -lr 0.01 -lbs 32 -go "ResNet18_e1_pathological_poisson_m20_p5q15" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 20 -jr 1.0 --on_demand_clients 15 --spot_clients 5 -lr 0.01 -lbs 32 -go "ResNet18_e1_pathological_poisson_m20_p15q5" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 20 -jr 1.0 --on_demand_clients 5 --spot_clients 15 -lr 0.01 -lbs 32 -go "ResNet18_e2_pathological_poisson_m20_p5q15" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 20 -jr 1.0 --on_demand_clients 15 --spot_clients 5 -lr 0.01 -lbs 32 -go "ResNet18_e2_pathological_poisson_m20_p15q5"

```