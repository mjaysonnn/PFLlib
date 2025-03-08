# IID Data Generation and Experiment Scripts

## Data Generation

```shell
cd ../dataset
python generate_Cifar10.py iid balance -
cd ../system
```

## Experiments Grouped by -gr (Global Rounds)

Each experiment runs FedAvg and SCAFFOLD with the same number of communication rounds (-gr), adjusting local steps (-ls) accordingly.

## Experiment Setup Table

| Global Rounds | Local Steps | Algorithm |
|--------------|-------------|-----------|
| 2500 | 1 | FedAvg |
| 2500 | 1 | Spot(p0_q100) |
| 2500 | 1 | Spot(p10_q90) |
| 2500 | 1 | Spot(p10_q100) |
| 2500 | 1 | Spot(p20_q80) |
| 2500 | 1 | Spot(p20_q90) |
| 2500 | 1 | Spot(p20_q100) |
| 2500 | 1 | Spot(p40_q60) |
| 2500 | 1 | Spot(p40_q70) |
| 2500 | 1 | Spot(p40_q80) |
| 2500 | 1 | Spot(p40_q90) |
| 2500 | 1 | Spot(p40_q100) |
| 2500 | 1 | Spot(p60_q40) |
| 2500 | 1 | Spot(p60_q50) |
| 2500 | 1 | Spot(p60_q60) |
| 2500 | 1 | Spot(p60_q70) |
| 2500 | 1 | Spot(p60_q80) |
| 2500 | 1 | Spot(p60_q90) |
| 2500 | 1 | Spot(p60_q100) |


| Global Rounds | Local Steps | Algorithm |
|--------------|-------------|-----------|
| 1250 | 2 | FedAvg |
| 1250 | 2 | Spot(p0_q100) |
| 1250 | 2 | Spot(p10_q90) |
| 1250 | 2 | Spot(p10_q100) |
| 1250 | 2 | Spot(p20_q80) |
| 1250 | 2 | Spot(p20_q90) |
| 1250 | 2 | Spot(p20_q100) |
| 1250 | 2 | Spot(p40_q60) |
| 1250 | 2 | Spot(p40_q70) |
| 1250 | 2 | Spot(p40_q80) |
| 1250 | 2 | Spot(p40_q90) |
| 1250 | 2 | Spot(p40_q100) |
| 1250 | 2 | Spot(p60_q40) |
| 1250 | 2 | Spot(p60_q50) |
| 1250 | 2 | Spot(p60_q60) |
| 1250 | 2 | Spot(p60_q70) |
| 1250 | 2 | Spot(p60_q80) |
| 1250 | 2 | Spot(p60_q90) |
| 1250 | 2 | Spot(p60_q100)|


## Experiment Commands by Global Rounds

### -gr 2500 (Local Steps: -ls 1)

```bash
# FedAvg - 2500 rounds, 1 local step
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0  -lr 0.01 -lbs 32 -go "iid_ResNet18_e1_exponential_p30_fedavg"

# SCAFFOLD - 2500 rounds, 1 local step
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 2500 -ls 1 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0  -lr 0.01 -slr 1.0 -lbs 32 -go "iid_ResNet18_e1_exponential_p30_scaffold"

# Spot (On-Demand: 30, Spot: 5, -jr=0.35)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.35 --on_demand_clients 30 --spot_clients 5  -lr 0.01 -lbs 32 -go "iid_ResNet18_e1_exponential_p30_spotq5"

# Spot (On-Demand: 30, Spot: 10, -jr=0.4)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.4 --on_demand_clients 30 --spot_clients 10  -lr 0.01 -lbs 32 -go "iid_ResNet18_e1_exponential_p30_spotq10"

# Spot (On-Demand: 30, Spot: 15, -jr=0.45)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.45 --on_demand_clients 30 --spot_clients 15  -lr 0.01 -lbs 32 -go "iid_ResNet18_e1_exponential_p30_spotq15"

# Spot (On-Demand: 30, Spot: 20, -jr=0.5)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr=0.5 --on_demand_clients=30 --spot_clients=20 --lr=0.01 --lbs=32 --go="iid_ResNet18_e1_exponential_p30_spotq20"

```

```bash
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0  -lr 0.01 -lbs 32 -go "iid_ResNet18_e1_exponential_p30_fedavg" && python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 2500 -ls 1 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0  -lr 0.01 -slr 1.0 -lbs 32 -go "iid_ResNet18_e1_exponential_p30_scaffold" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.35 --on_demand_clients 30 --spot_clients 5  -lr 0.01 -lbs 32 -go "iid_ResNet18_e1_exponential_p30_spotq5" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.4 --on_demand_clients 30 --spot_clients 10  -lr 0.01 -lbs 32 -go "iid_ResNet18_e1_exponential_p30_spotq10" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.45 --on_demand_clients 30 --spot_clients 15  -lr 0.01 -lbs 32 -go "iid_ResNet18_e1_exponential_p30_spotq15" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr=0.5 --on_demand_clients=30 --spot_clients=20 --lr=0.01 --lbs=32 --go="iid_ResNet18_e1_exponential_p30_spotq20"
```


### -gr 1250 (Local Steps: -ls 2)

```bash
# FedAvg - 1250 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0 -lr 0.01 -lbs 32 -go "iid_ResNet18_e2_exponential_p30_fedavg"

# SCAFFOLD - 1250 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 1250 -ls 2 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0 -lr 0.01 -slr 1.0 -lbs 32 -go "iid_ResNet18_e2_exponential_p30_scaffold"

# FedAvg (On-Demand: 30, Spot: 5, -jr=0.35)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.35 --on_demand_clients 30 --spot_clients 5 -lr 0.01 -lbs 32 -go "iid_ResNet18_e2_exponential_p30_spotq5"

# FedAvg (On-Demand: 30, Spot: 10, -jr=0.4)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.4 --on_demand_clients 30 --spot_clients 10 -lr 0.01 -lbs 32 -go "iid_ResNet18_e2_exponential_p30_spotq10"

# FedAvg (On-Demand: 30, Spot: 15, -jr=0.45)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.45 --on_demand_clients 30 --spot_clients 15 -lr 0.01 -lbs 32 -go "iid_ResNet18_e2_exponential_p30_spotq15"

# FedAvg (On-Demand: 30, Spot: 20, -jr=0.5)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.5 --on_demand_clients 30 --spot_clients 20 -lr 0.01 -lbs 32 -go "iid_ResNet18_e2_exponential_p30_spotq20"

```

```bash
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0 -lr 0.01 -lbs 32 -go "iid_ResNet18_e2_exponential_p30_fedavg" && python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 1250 -ls 2 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0 -lr 0.01 -slr 1.0 -lbs 32 -go "iid_ResNet18_e2_exponential_p30_scaffold" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.35 --on_demand_clients 30 --spot_clients 5 -lr 0.01 -lbs 32 -go "iid_ResNet18_e2_exponential_p30_spotq5" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.4 --on_demand_clients 30 --spot_clients 10 -lr 0.01 -lbs 32 -go "iid_ResNet18_e2_exponential_p30_spotq10" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.45 --on_demand_clients 30 --spot_clients 15 -lr 0.01 -lbs 32 -go "iid_ResNet18_e2_exponential_p30_spotq15" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.5 --on_demand_clients 30 --spot_clients 20 -lr 0.01 -lbs 32 -go "iid_ResNet18_e2_exponential_p30_spotq20"
```