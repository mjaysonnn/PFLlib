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

|  2500   | 1 | Spot(p20_q5) | `Jisoo3`
|  2500   | 1 | Spot(p20_q10) | `Jisoo4`
|  2500   | 1 | Spot(p20_q15) | `Jisoo5`
|  2500   | 1 | Spot(p20_q20) | `View1`


|  1250   | 2 | Spot(p20_q5) | `View4`
|  1250   | 2 | Spot(p20_q10) | `View5`
|  1250   | 2 | Spot(p20_q15) | `Jisoo1`
|  1250   | 2 | Spot(p20_q20) | `Jisoo2`

## Experiment Commands by Global Rounds


### -gr 2500 (Local Steps: -ls 1)

```bash
# FedAvg - 2500 rounds, 1 local step
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0   -lr 0.01 -lbs 32 -go "non_iid_resnet18_e1_fedavg_poisson"

# SCAFFOLD - 2500 rounds, 1 local step
# python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 2500 -ls 1 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0   -lr 0.01 -slr 1.0 -lbs 32 -go "non_iid_resnet18_e1_scaffold_poisson"

# Spot (On-Demand: 20, Spot: 5, -jr=0.25)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5   -lr 0.01 -lbs 32 -go "non_iid_resnet18_e1_poisson_pathological_spotq5"

# Spot (On-Demand: 20, Spot: 10, -jr=0.3)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10   -lr 0.01 -lbs 32 -go "non_iid_resnet18_e1_poisson_pathological_spotq10"

# Spot (On-Demand: 20, Spot: 15, -jr=0.35)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e1_poisson_pathological_spotq15"

# Spot (On-Demand: 20, Spot: 20, -jr=0.4)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e1_poisson_pathological_spotq20"
```


## -gr 1250 (Local Steps: -ls 2)

```bash
# FedAvg - 1250 rounds, 2 local steps
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0   -lr 0.01 -lbs 32 -go "non_iid_resnet18_e2_fedavg_poisson"

# SCAFFOLD - 1250 rounds, 2 local steps
# python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 1250 -ls 2 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0   -lr 0.01 -slr 1.0 -lbs 32 -go "non_iid_resnet18_e2_scaffold_poisson"

# FedAvg (On-Demand: 20, Spot: 5, -jr=0.25)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e2_poisson_pathological_spotq5"

# FedAvg (On-Demand: 20, Spot: 10, -jr=0.3)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e2_poisson_pathological_spotq10"

# FedAvg (On-Demand: 20, Spot: 15, -jr=0.35)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e2_poisson_pathological_spotq15"

# FedAvg (On-Demand: 20, Spot: 20, -jr=0.4)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20 -lr 0.01 -lbs 32 -go "non_iid_resnet18_e2_poisson_pathological_spotq20"

```

