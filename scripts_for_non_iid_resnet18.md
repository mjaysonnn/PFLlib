
# Federated Learning Experiments: FedAvg vs SCAFFOLD

This document outlines the FedAvg and SCAFFOLD experiments using Cifar10 dataset under different global rounds (-gr) and local steps (-ls).

## Data Generation

Run the following commands to generate the dataset before running experiments:

```bash
cd ../dataset
python generate_Cifar10.py noniid unbalance dir
cd ../system
```

## Experiments Grouped by -gr (Global Rounds)

Each experiment runs FedAvg and SCAFFOLD with the same number of communication rounds (-gr), adjusting local steps (-ls) accordingly.

## Experiment Setup Table

| Global Rounds (`-gr`) | Local Steps (`-ls`) | Algorithm | Run Name  |
|-----------------------|--------------------|------------|------------|
| 🟢 2500  | 1  | FedAvg | `Jisoo1` (Done) |
| 🟢 2500  | 1  | SCAFFOLD |  |
| 🟢 2500  | 1  | Spot(p20_q5) | `Jisoo1` (Done) |
| 🟢 2500  | 1  | Spot(p20_q10) | `Jisoo2` (Done) |
| 🟢 2500  | 1  | Spot(p20_q15) | `Jisoo3` (Done) |
| 🟢 2500  | 1  | Spot(p20_q20) | `Jisoo4` (Done) |
| 🟢 1250  | 2  | FedAvg |  |
| 🟢 1250  | 2  | SCAFFOLD |  |
| 🟢 1250  | 2  | Spot(p20_q5) | `Jisoo5` (Done) |
| 🟢 1250  | 2  | Spot(p20_q10) | `View1` (Done) |
| 🟢 1250  | 2  | Spot(p20_q15) | `View2` (Done) |
| 🟢 1250  | 2  | Spot(p20_q20) | `View3` (Done) |
| 🟢 500   | 5  | FedAvg |  |
| 🟢 500   | 5  | SCAFFOLD |  |
| 🟢 500  | 5  | Spot(p20_q5) | `View4` (Done) |
| 🟢 500  | 5  | Spot(p20_q10) | `View5` (Done) |
| 🟢 500  | 5  | Spot(p20_q15) | `Jisoo2` (Done) |
| 🟢 500  | 5  | Spot(p20_q20) | `Jisoo3` (Done) |
| 🟢 250   | 10 | FedAvg |  |
| 🟢 250   | 10 | SCAFFOLD |  |
| 🟢 250  | 10  | Spot(p20_q5) | `Jisoo4` (Done) |
| 🟢 250  | 10  | Spot(p20_q10) | `View1` (Done) |
| 🟢 250  | 10  | Spot(p20_q15) | `View2` (Done)|
| 🟢 250  | 10  | Spot(p20_q20) | `View3` (Done) |

## Experiment Commands by Global Rounds


### -gr 2500 (Local Steps: -ls 1)
```bash
# FedAvg - 2500 rounds, 1 local step
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.2 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_p20_q0_gr2500"

# SCAFFOLD - 2500 rounds, 1 local step
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 2500 -ls 1 -nc 100 -jr 0.2 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 -go "non_iid_p20_q0_gr2500"

# Spot (On-Demand: 20, Spot: 5, -jr=0.25)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_p20_q5_r2500"

# Spot (On-Demand: 20, Spot: 10, -jr=0.3)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_p20_q10_r2500"

# Spot (On-Demand: 20, Spot: 15, -jr=0.35)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_p20_q15_r2500"

# Spot (On-Demand: 20, Spot: 20, -jr=0.4)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_p20_q20_r2500"
```

## -gr 1250 (Local Steps: -ls 2)

```bash
# FedAvg - 1250 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.2 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_p20_q0_gr1250"

# SCAFFOLD - 1250 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 1250 -ls 2 -nc 100 -jr 0.2 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 -go "non_iid_p20_q0_gr1250"

# FedAvg (On-Demand: 20, Spot: 5, -jr=0.25)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_p20_q5_r1250"

# FedAvg (On-Demand: 20, Spot: 10, -jr=0.3)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_p20_q10_r1250"

# FedAvg (On-Demand: 20, Spot: 15, -jr=0.35)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_p20_q15_r1250"

# FedAvg (On-Demand: 20, Spot: 20, -jr=0.4)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_p20_q20_r1250"

```


## -gr 500 (Local Steps: -ls 5)
```bash
# FedAvg - 500 rounds, 5 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 5 -nc 100 -jr 0.2 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_p20_q0_gr500"

# SCAFFOLD - 500 rounds, 5 local steps
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 500 -ls 5 -nc 100 -jr 0.2 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 -go "non_iid_p20_q0_gr500"

# FedAvg (On-Demand: 20, Spot: 5, -jr=0.25)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 5 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_p20_q5_r500"

# FedAvg (On-Demand: 20, Spot: 10, -jr=0.3)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 5 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_p20_q10_r500"

# FedAvg (On-Demand: 20, Spot: 15, -jr=0.35)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 5 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_p20_q15_r500"

# FedAvg (On-Demand: 20, Spot: 20, -jr=0.4)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 5 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_p20_q20_r500"
```




## -gr 250 (Local Steps: -ls 10)

```bash
# FedAvg - 250 rounds, 10 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.2 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_p20_q0_gr250"

# SCAFFOLD - 250 rounds, 10 local steps
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 250 -ls 10 -nc 100 -jr 0.2 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 -go "non_iid_p20_q0_gr250"

# Spot (On-Demand: 20, Spot: 5, -jr=0.25)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_p20_q5_r250"

# Spot (On-Demand: 20, Spot: 10, -jr=0.3)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_p20_q10_r250"

# FedAvg (On-Demand: 20, Spot: 15, -jr=0.35)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_p20_q15_r250"

# FedAvg (On-Demand: 20, Spot: 20, -jr=0.4)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 -go "non_iid_p20_q20_r250"
```
