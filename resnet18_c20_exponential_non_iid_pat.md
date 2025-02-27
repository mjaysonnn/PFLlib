## Data Generation

Run the following commands to generate the dataset before running experiments:

```bash
cd ../dataset
python generate_Cifar10.py noniid - pat
cd ../system
```

## Experiment Setup Table

| Global Rounds (`-gr`) | Local Steps (`-ls`) | Algorithm | Run Name | Status |
|-----------------------|--------------------|-----------|----------|--------|

 
| 2500 | 1 | Spot(p20_q5) | `Jisoo1` | Done
| 2500 | 1 | Spot(p20_q10)| `Jisoo2` | Done
| 2500 | 1 | Spot(p20_q15)| `Jisoo3` | Done
| 2500 | 1 | Spot(p20_q20)| `Jisoo4` |

| 1250 | 2 | Spot(p20_q5) | `Jisoo5` | Done
| 1250 | 2 | Spot(p20_q10)| `View1`  | Done
| 1250 | 2 | Spot(p20_q15)| `View4`  | Done
| 1250 | 2 | Spot(p20_q20)| `View5`  | Done


### -gr 2500 (Local Steps: -ls 1)

```bash
# FedAvg - 2500 rounds, 1 local step
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e1_exponential_pathological_fedavg"

# SCAFFOLD - 2500 rounds, 1 local step
# python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 2500 -ls 1 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 -go "non_iid_resnet18_e1_exponential_pathological_scaffold"

# Spot (On-Demand: 20, Spot: 5, -jr=0.25)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e1_exponential_pathological_spotq5"

# Spot (On-Demand: 20, Spot: 10, -jr=0.3)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e1_exponential_pathological_spotq10"

# Spot (On-Demand: 20, Spot: 15, -jr=0.35)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e1_exponential_pathological_spotq15"

# Spot (On-Demand: 20, Spot: 20, -jr=0.4)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e1_exponential_pathological_spotq20"

```


## -gr 1250 (Local Steps: -ls 2)

```bash
# FedAvg - 1250 rounds, 2 local steps
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e2_exponential_pathological_fedavg"

# SCAFFOLD - 1250 rounds, 2 local steps
# python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 1250 -ls 2 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 -go "non_iid_resnet18_e2_exponential_pathological_scaffold"

# Spot (On-Demand: 20, Spot: 5, -jr=0.25)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e2_exponential_pathological_spotq5"

# Spot (On-Demand: 20, Spot: 10, -jr=0.3)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e2_exponential_pathological_spotq10"

# Spot (On-Demand: 20, Spot: 15, -jr=0.35)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e2_exponential_pathological_spotq15"

# Spot (On-Demand: 20, Spot: 20, -jr=0.4)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e2_exponential_pathological_spotq20"

```

