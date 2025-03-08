# IID Data Generation and Experiment Scripts

## Data Generation

```shell
cd ../dataset
python generate_Cifar10.py iid balance -
cd ../system
```

- iid → Ensures the dataset is split independently and identically across all clients.
- balance → Ensures each client receives approximately the same amount of data.
- "-" → No specific partition method needed (as it’s IID).


## Experiment Setup Table

| Global Rounds | Local Steps | Algorithm |
|--------------|-------------|-----------|
| 250 | 1 | FedAvg |
| 250 | 1 | Spot(p0_q100) |
| 250 | 1 | Spot(p10_q90) |
| 250 | 1 | Spot(p10_q100) |
| 250 | 1 | Spot(p20_q80) |
| 250 | 1 | Spot(p20_q90) |
| 250 | 1 | Spot(p20_q100) |
| 250 | 1 | Spot(p40_q60) |
| 250 | 1 | Spot(p40_q70) |
| 250 | 1 | Spot(p40_q80) |
| 250 | 1 | Spot(p40_q90) |
| 250 | 1 | Spot(p40_q100) |
| 250 | 1 | Spot(p60_q40) |
| 250 | 1 | Spot(p60_q50) |
| 250 | 1 | Spot(p60_q60) |
| 250 | 1 | Spot(p60_q70) |
| 250 | 1 | Spot(p60_q80) |
| 250 | 1 | Spot(p60_q90) |
| 250 | 1 | Spot(p60_q100) |


| Global Rounds | Local Steps | Algorithm |
|--------------|-------------|-----------|
| 125 | 2 | FedAvg |
| 125 | 2 | Spot(p0_q100) |
| 125 | 2 | Spot(p10_q90) |
| 125 | 2 | Spot(p10_q100) |
| 125 | 2 | Spot(p20_q80) |
| 125 | 2 | Spot(p20_q90) |
| 125 | 2 | Spot(p20_q100) |
| 125 | 2 | Spot(p40_q60) |
| 125 | 2 | Spot(p40_q70) |
| 125 | 2 | Spot(p40_q80) |
| 125 | 2 | Spot(p40_q90) |
| 125 | 2 | Spot(p40_q100) |
| 125 | 2 | Spot(p60_q40) |
| 125 | 2 | Spot(p60_q50) |
| 125 | 2 | Spot(p60_q60) |
| 125 | 2 | Spot(p60_q70) |
| 125 | 2 | Spot(p60_q80) |
| 125 | 2 | Spot(p60_q90) |
| 125 | 2 | Spot(p60_q100)|



## Experiment Commands by Global Rounds

## -gr 250 (Local Epochs: -ls 10)

```bash
# FedAvg - 250 rounds, 10 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0 -lr 0.01 -lbs 32 -go "iid_resnet18_e10_exponential_p30_fedavg"

# SCAFFOLD - 250 rounds, 10 local steps
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 250 -ls 10 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0 -lr 0.01 -slr 1.0 -lbs 32 -go "iid_resnet18_e10_exponential_p30_scaffold"

# Spot (On-Demand: 30, Spot: 5, -jr 0.35)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.35 --on_demand_clients 30 --spot_clients 5 -lr 0.01 -lbs 32 -go "iid_resnet18_e10_exponential_p30_spotq5"

# Spot (On-Demand: 30, Spot: 10, -jr 0.4)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.4 --on_demand_clients 30 --spot_clients 10 -lr 0.01 -lbs 32 -go "iid_resnet18_e10_exponential_p30_spotq10"

# Spot (On-Demand: 30, Spot: 15, -jr 0.45)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.45 --on_demand_clients 30 --spot_clients 15 -lr 0.01 -lbs 32 -go "iid_resnet18_e10_exponential_p30_spotq15"

# Spot (On-Demand: 30, Spot: 20, -jr 0.5)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.5 --on_demand_clients 30 --spot_clients 20 -lr 0.01 -lbs 32 -go "iid_resnet18_e10_exponential_p30_spotq20"
```

```bash
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0 -lr 0.01 -lbs 32 -go "iid_resnet18_e10_exponential_p30_fedavg" && python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 250 -ls 10 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0 -lr 0.01 -slr 1.0 -lbs 32 -go "iid_resnet18_e10_exponential_p30_scaffold" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.35 --on_demand_clients 30 --spot_clients 5 -lr 0.01 -lbs 32 -go "iid_resnet18_e10_exponential_p30_spotq5" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.4 --on_demand_clients 30 --spot_clients 10 -lr 0.01 -lbs 32 -go "iid_resnet18_e10_exponential_p30_spotq10" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.45 --on_demand_clients 30 --spot_clients 15 -lr 0.01 -lbs 32 -go "iid_resnet18_e10_exponential_p30_spotq15" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.5 --on_demand_clients 30 --spot_clients 20 -lr 0.01 -lbs 32 -go "iid_resnet18_e10_exponential_p30_spotq20"
```

## -gr 125 (Local Epochs: -ls 20)

```bash
# FedAvg - 125 rounds, 20 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0 -lr 0.01 -lbs 32 -go "iid_resnet18_e20_exponential_p30_fedavg"

# SCAFFOLD - 125 rounds, 20 local steps
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 125 -ls 20 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0 -lr 0.01 -slr 1.0 -lbs 32 -go "iid_resnet18_e20_exponential_p30_scaffold"

# Spot (On-Demand: 30, Spot: 5, -jr=0.35)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 100 -jr 0.35 --on_demand_clients 30 --spot_clients 5 -lr 0.01 -lbs 32 -go "iid_resnet18_e20_exponential_p30_spotq5"

# Spot (On-Demand: 30, Spot: 10, -jr=0.4)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 100 -jr 0.4 --on_demand_clients 30 --spot_clients 10 -lr 0.01 -lbs 32 -go "iid_resnet18_e20_exponential_p30_spotq10"

# Spot (On-Demand: 30, Spot: 15, -jr=0.45)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 100 -jr 0.45 --on_demand_clients 30 --spot_clients 15 -lr 0.01 -lbs 32 -go "iid_resnet18_e20_exponential_p30_spotq15"

# Spot (On-Demand: 30, Spot: 20, -jr=0.5)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 100 -jr 0.5 --on_demand_clients 30 --spot_clients 20 -lr 0.01 -lbs 32 -go "iid_resnet18_e20_exponential_p30_spotq20"

```

```bash
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0 -lr 0.01 -lbs 32 -go "iid_resnet18_e20_exponential_p30_fedavg" && python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 125 -ls 20 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0 -lr 0.01 -slr 1.0 -lbs 32 -go "iid_resnet18_e20_exponential_p30_scaffold" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 100 -jr 0.35 --on_demand_clients 30 --spot_clients 5 -lr 0.01 -lbs 32 -go "iid_resnet18_e20_exponential_p30_spotq5" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 100 -jr 0.4 --on_demand_clients 30 --spot_clients 10 -lr 0.01 -lbs 32 -go "iid_resnet18_e20_exponential_p30_spotq10" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 100 -jr 0.45 --on_demand_clients 30 --spot_clients 15 -lr 0.01 -lbs 32 -go "iid_resnet18_e20_exponential_p30_spotq15" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 100 -jr 0.5 --on_demand_clients 30 --spot_clients 20 -lr 0.01 -lbs 32 -go "iid_resnet18_e20_exponential_p30_spotq20"
```



