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

## Experiments Grouped by -gr (Global Rounds)

Each experiment runs FedAvg and SCAFFOLD with the same number of communication rounds (-gr), adjusting local steps (-ls) accordingly.

## Experiment Setup Table

| Size | Epochs | Method         | Server | Status |
|------|--------|----------------|--------|--------|

| 250  | 10     | Spot(p20_q5)   | `View2` | 
| 250  | 10     | Spot(p20_q10)  | `View3` |
| 250  | 10     | Spot(p20_q15)  | 
| 250  | 10     | Spot(p20_q20)  | 

| 125  | 20     | Spot(p20_q5)   | 
| 125  | 20     | Spot(p20_q10)  | 
| 125  | 20     | Spot(p20_q15)  | 
| 125  | 20     | Spot(p20_q20)  | 



## Experiment Commands by Global Rounds

## -gr 250 (Local Epochs: -ls 10)

```bash
# FedAvg - 250 rounds, 10 local steps
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0  -lr 0.01 -lbs 32 -go "iid_resnet18_e10_fedavg_exponential"

# SCAFFOLD - 250 rounds, 10 local steps
# python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 250 -ls 10 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0  -lr 0.01 -slr 1.0 -lbs 32 -go "iid_resnet18_e10_scaffold_exponential"

# Spot (On-Demand: 20, Spot: 5, -jr=0.25)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5  -lr 0.01 -lbs 32 -go "iid_resnet18_e10_exponential_spotq5"

# Spot (On-Demand: 20, Spot: 10, -jr=0.3)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10  -lr 0.01 -lbs 32 -go "iid_resnet18_e10_exponential_spotq10"

# Spot (On-Demand: 20, Spot: 15, -jr=0.35)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15  -lr 0.01 -lbs 32 -go "iid_resnet18_e10_exponential_spotq15"

# Spot (On-Demand: 20, Spot: 20, -jr=0.4)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20  -lr 0.01 -lbs 32 -go "iid_resnet18_e10_exponential_spotq20"
```


## -gr 125 (Local Epochs: -ls 20)

```bash
# FedAvg - 125 rounds, 20 local steps
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0  -lr 0.01 -lbs 32 -go "iid_resnet18_e20_fedavg_exponential"

# SCAFFOLD - 125 rounds, 20 local steps
# python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 125 -ls 20 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0  -lr 0.01 -slr 1.0 -lbs 32 -go "iid_resnet18_e20_scaffold_exponential"

# Spot (On-Demand: 20, Spot: 5, -jr=0.25)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5  -lr 0.01 -lbs 32 -go "iid_resnet18_e20_exponential_spotq5"

# Spot (On-Demand: 20, Spot: 10, -jr=0.3)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10  -lr 0.01 -lbs 32 -go "iid_resnet18_e20_exponential_spotq10"

# Spot (On-Demand: 20, Spot: 15, -jr=0.35)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15  -lr 0.01 -lbs 32 -go "iid_resnet18_e20_exponential_spotq15"

# Spot (On-Demand: 20, Spot: 20, -jr=0.4)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20  -lr 0.01 -lbs 32 -go "iid_resnet18_e20_exponential_spotq20"
```




