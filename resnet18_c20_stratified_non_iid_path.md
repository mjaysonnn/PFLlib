## Data Generation

Run the following commands to generate the dataset before running experiments:

```bash
cd ../dataset
python generate_Cifar10.py noniid - pat
cd ../system
```

## Experiment Setup Table

|-----------------------|--------------------|------------|------------|
| Global Rounds (`-gr`) | Local Steps (`-ls`) | Algorithm | Run Name  | Status | 
|-----------------------|--------------------|------------|------------|------------|
|  2500   | 1 | FedAvg        | `Jisoo5` |
|  2500   | 1 | Scaffold      | `View1`  |
|  2500   | 1 | Spot(p20_q5)  | |
|  2500   | 1 | Spot(p20_q10) | |
|  2500   | 1 | Spot(p20_q15) | |
|  2500   | 1 | Spot(p20_q20) | |

|  1250   | 2 | FedAvg        | |
|  1250   | 2 | Scaffold      | |
|  1250   | 2 | Spot(p20_q5)  | |
|  1250   | 2 | Spot(p20_q10) | |
|  1250   | 2 | Spot(p20_q15) | |
|  1250   | 2 | Spot(p20_q20) | |


## Experiment Commands by Global Rounds


### -gr 2500 (Local Steps: -ls 1)

```bash
# FedAvg - 2500 rounds, 1 local step
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e1_fedavg_pathological_stratified"

# SCAFFOLD - 2500 rounds, 1 local step
# python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 2500 -ls 1 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 -go "non_iid_resnet18_e1_scaffold_pathological_stratified"

# Spot (On-Demand: 20, Spot: 5, -jr=0.25)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e1_spotq5_pathological_stratified"

# Spot (On-Demand: 20, Spot: 10, -jr=0.3)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e1_spotq10_pathological_stratified"

# Spot (On-Demand: 20, Spot: 15, -jr=0.35)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e1_spotq15_pathological_stratified"

# Spot (On-Demand: 20, Spot: 20, -jr=0.4)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e1_spotq20_pathological_stratified"
```


## -gr 1250 (Local Steps: -ls 2)

```bash
# FedAvg - 1250 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e2_fedavg_pathological_stratified"

# SCAFFOLD - 1250 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 1250 -ls 2 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 -go "non_iid_resnet18_e2_scaffold_pathological_stratified"

# FedAvg (On-Demand: 20, Spot: 5, -jr=0.25)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e2_spotq5_pathological_stratified"

# FedAvg (On-Demand: 20, Spot: 10, -jr=0.3)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e2_spotq10_pathological_stratified"

# FedAvg (On-Demand: 20, Spot: 15, -jr=0.35)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e2_spotq15_pathological_stratified"

# FedAvg (On-Demand: 20, Spot: 20, -jr=0.4)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e2_spotq20_pathological_stratified"

```

