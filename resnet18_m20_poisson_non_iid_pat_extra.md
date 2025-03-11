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

| 250 | 10 | Spot(p5_q15) |
| 250 | 10 | Spot(p15_q5) |

| Global Rounds | Local Steps | Algorithm |
|--------------|-------------|-----------|

| 125 | 20 | Spot(p5_q15) |
| 125 | 20 | Spot(p15_q5) |



### -gr 250 (Local Steps: -ls 10 )

```bash
# FedAvg - 250 rounds, 10 local step
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10  -nc 20 -jr 1.0 --on_demand_clients 5 --spot_clients 15 -lr 0.01 -lbs 32 -go "ResNet18_e10_poisson_pathological_m20_p5q15"


# Spot(p15_q30) - 250 rounds, 10 local step
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10  -nc 20 -jr 1.0 --on_demand_clients 15 --spot_clients 5 -lr 0.01 -lbs 32 -go "ResNet18_e10_poisson_pathological_m20_p15q5"

```




## -gr 125 (Local Steps: -ls 20)

```bash
# FedAvg - 250 rounds, 10 local step
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20  -nc 20 -jr 1.0 --on_demand_clients 5 --spot_clients 15 -lr 0.01 -lbs 32 -go "ResNet18_e20_poisson_pathological_m20_p5q15"


# Spot(p15_q30) - 250 rounds, 10 local step
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20  -nc 20 -jr 1.0 --on_demand_clients 15 --spot_clients 5 -lr 0.01 -lbs 32 -go "ResNet18_e20_poisson_pathological_m20_p15q5"
```

```bash
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10  -nc 20 -jr 1.0 --on_demand_clients 5 --spot_clients 15 -lr 0.01 -lbs 32 -go "ResNet18_e10_poisson_pathological_m20_p5q15" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10  -nc 20 -jr 1.0 --on_demand_clients 15 --spot_clients 5 -lr 0.01 -lbs 32 -go "ResNet18_e10_poisson_pathological_m20_p15q5" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20  -nc 20 -jr 1.0 --on_demand_clients 5 --spot_clients 15 -lr 0.01 -lbs 32 -go "ResNet18_e20_poisson_pathological_m20_p5q15" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20  -nc 20 -jr 1.0 --on_demand_clients 15 --spot_clients 5 -lr 0.01 -lbs 32 -go "ResNet18_e20_poisson_pathological_m20_p15q5"
```