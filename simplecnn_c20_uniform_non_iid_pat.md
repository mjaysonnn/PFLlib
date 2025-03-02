
# Federated Learning Experiments: FedAvg vs SCAFFOLD vs Spot

This document outlines the FedAvg and SCAFFOLD experiments using Cifar10 dataset under different global rounds (-gr) and local steps (-ls).

## Data Generation

Run the following commands to generate the dataset before running experiments:

```bash
cd ../dataset
python generate_Cifar10.py noniid - pat
cd ../system
```

## Experiments Grouped by -gr (Global Rounds)

Each experiment runs FedAvg and SCAFFOLD with the same number of communication rounds (-gr), adjusting local steps (-ls) accordingly.

## Experiment Setup Table

|-----------------------|--------------------|------------|------------|
| Global Rounds (`-gr`) | Local Steps (`-ls`) | Algorithm | Run Name  | Status | 
|-----------------------|--------------------|------------|------------|------------|

|  2500   | 1 | Spot(p20_q5) | | `Jisoo2` |
|  2500   | 1 | Spot(p20_q10) | |
|  2500   | 1 | Spot(p20_q15) | |
|  2500   | 1 | Spot(p20_q20) | |


|  1250   | 2 | Spot(p20_q5) | | `View5` |
|  1250   | 2 | Spot(p20_q10) | |
|  1250   | 2 | Spot(p20_q15) | |
|  1250   | 2 | Spot(p20_q20) | |

## Experiment Commands by Global Rounds


### -gr 2500 (Local Steps: -ls 1)

```bash
# FedAvg - 2500 rounds, 1 local step
# python main.py -data Cifar10 -m CNN -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0  -lr 0.01 -lbs 32 -go "non_iid_CNN_e1_fedavg_uniform"

# SCAFFOLD - 2500 rounds, 1 local step
# python main.py -data Cifar10 -m CNN -algo SCAFFOLD -gr 2500 -ls 1 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0  -lr 0.01 -slr 1.0 -lbs 32 -go "non_iid_CNN_e1_scaffold_uniform"

# Spot (On-Demand: 20, Spot: 5, -jr=0.25)
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5  -lr 0.01 -lbs 32 -go "non_iid_CNN_e1_uniform_pathological_spotq5"

# Spot (On-Demand: 20, Spot: 10, -jr=0.3)
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10  -lr 0.01 -lbs 32 -go "non_iid_CNN_e1_uniform_pathological_spotq10"

# Spot (On-Demand: 20, Spot: 15, -jr=0.35)
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15  -lr 0.01 -lbs 32 -go "non_iid_CNN_e1_uniform_pathological_spotq15"

# Spot (On-Demand: 20, Spot: 20, -jr=0.4)
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20  -lr 0.01 -lbs 32 -go "non_iid_CNN_e1_uniform_pathological_spotq20"
```

```bash
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5  -lr 0.01 -lbs 32 -go "non_iid_CNN_e1_uniform_pathological_spotq5" && python main.py -data Cifar10 -m CNN -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10  -lr 0.01 -lbs 32 -go "non_iid_CNN_e1_uniform_pathological_spotq10" && python main.py -data Cifar10 -m CNN -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15  -lr 0.01 -lbs 32 -go "non_iid_CNN_e1_uniform_pathological_spotq15" && python main.py -data Cifar10 -m CNN -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20  -lr 0.01 -lbs 32 -go "non_iid_CNN_e1_uniform_pathological_spotq20"
```

## -gr 1250 (Local Steps: -ls 2)

```bash
# FedAvg - 1250 rounds, 2 local steps
# python main.py -data Cifar10 -m CNN -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0  -lr 0.01 -lbs 32 -go "non_iid_CNN_e2_uniform_pathological_fedavg"

# SCAFFOLD - 1250 rounds, 2 local steps
# python main.py -data Cifar10 -m CNN -algo SCAFFOLD -gr 1250 -ls 2 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0  -lr 0.01 -slr 1.0 -lbs 32 -go "non_iid_CNN_e2_scaffold_uniform"

# FedAvg (On-Demand: 20, Spot: 5, -jr=0.25)
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5  -lr 0.01 -lbs 32 -go "non_iid_CNN_e2_uniform_pathological_spotq5"

# FedAvg (On-Demand: 20, Spot: 10, -jr=0.3)
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10  -lr 0.01 -lbs 32 -go "non_iid_CNN_e2_uniform_pathological_spotq10"

# FedAvg (On-Demand: 20, Spot: 15, -jr=0.35)
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15  -lr 0.01 -lbs 32 -go "non_iid_CNN_e2_uniform_pathological_spotq15"

# FedAvg (On-Demand: 20, Spot: 20, -jr=0.4)
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20  -lr 0.01 -lbs 32 -go "non_iid_CNN_e2_uniform_pathological_spotq20"

```

```bash
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5  -lr 0.01 -lbs 32 -go "non_iid_CNN_e2_uniform_pathological_spotq5" && python main.py -data Cifar10 -m CNN -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10  -lr 0.01 -lbs 32 -go "non_iid_CNN_e2_uniform_pathological_spotq10" && python main.py -data Cifar10 -m CNN -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15  -lr 0.01 -lbs 32 -go "non_iid_CNN_e2_uniform_pathological_spotq15" && python main.py -data Cifar10 -m CNN -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20  -lr 0.01 -lbs 32 -go "non_iid_CNN_e2_uniform_pathological_spotq20"

```
