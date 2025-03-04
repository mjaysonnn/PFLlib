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

| Global Rounds (`-gr`) | Local Steps (`-ls`) | Algorithm | Run Name  | Status | 
|-----------------------|--------------------|------------|------------|------------|
| 2500    | 1 | FedAvg | 
| 2500    | 1 | Scaffold |
|  2500   | 1 | Spot(p30_q5) | 
|  2500   | 1 | Spot(p30_q10) | 
|  2500   | 1 | Spot(p30_q15) | 
|  2500   | 1 | Spot(p30_q20) | 


|  1250   | 2 | FedAvg | 
|  1250   | 2 | Scaffold | 
|  1250   | 2 | Spot(p30_q5) | 
|  1250   | 2 | Spot(p30_q10) |
|  1250   | 2 | Spot(p30_q15) |
|  1250   | 2 | Spot(p30_q20) |
 
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

