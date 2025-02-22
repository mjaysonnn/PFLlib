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

| Global Rounds (`-gr`) | Local Steps (`-ls`) | Algorithm | Run Name  | Status | 
|-----------------------|--------------------|------------|------------|------------|

<!-- |  2500  | 1  | FedAvg |  |
|  2500  | 1  | SCAFFOLD |  |
|  2500  | 1  | Spot(p20_q5) | `View4` (Done) -> `View3` (Done) |
|  2500  | 1  | Spot(p20_q10) | `View5` (Done) -> `View4` (Done) |
|  2500  | 1  | Spot(p20_q15) | `Jisoo` (Done) -> `View5`(Done) |
|  2500  | 1  | Spot(p20_q20) | `Jisoo2` (Done) -> `Jisoo2` (Done) |

|  1250  | 2  | FedAvg |  |
|  1250  | 2  | SCAFFOLD |  |
|  1250  | 2  | Spot(p20_q5) | `Jisoo3` (Done) -> `Jisoo3` (Done) |
|  1250  | 2  | Spot(p20_q10) | `Jisoo4` (Done) -> `Jisoo4` (Done) |
|  1250  | 2  | Spot(p20_q15) | `View1` (Done) -> `Jisoo5` (Done) |
|  1250  | 2  | Spot(p20_q20) | `View2` (Done) -> `View1` (Done)  |

|  500   | 5  | FedAvg |  |
|  500   | 5  | SCAFFOLD |  |
|  500  | 5  | Spot(p20_q5) | `View3` (Done) -> `View2` (Done) |
|  500  | 5  | Spot(p20_q10) | `View4` (Done) -> `Jisoo1` (Done) |
|  500  | 5  | Spot(p20_q15) | `View5` (Done) -> `View3` (Done) |
|  500  | 5  | Spot(p20_q20) | `Jisoo5` (Done) -> `View4` (Done)| -->

|  10000   | 1 | FedAvg | |
|  10000   | 1 | SCAFFOLD | |
|  10000   | 1 | Spot(p20_q5) | |
|  10000   | 1 | Spot(p20_q10) | |
|  10000   | 1 | Spot(p20_q15) | |
|  10000   | 1 | Spot(p20_q20) | |

|  5000   | 2 | FedAvg | |
|  5000   | 2 | SCAFFOLD | |
|  5000   | 2 | Spot(p20_q5) |  |
|  5000   | 2 | Spot(p20_q10) | |
|  5000   | 2 | Spot(p20_q15) |  |
|  5000   | 2 | Spot(p20_q20) |  |


## Experiment Commands by Global Rounds


### -gr 10000 (Local Steps: -ls 1)

```bash
# FedAvg - 2500 rounds, 1 local step
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 10000 -ls 1 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e1_fedavg_uniform"

# SCAFFOLD - 2500 rounds, 1 local step
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 10000 -ls 1 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 -go "iid_resnet18_e1_scaffold"

# Spot (On-Demand: 20, Spot: 5, -jr=0.25)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 10000 -ls 1 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e1_spotq5_uniform"

# Spot (On-Demand: 20, Spot: 10, -jr=0.3)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 10000 -ls 1 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e1_spotq10_uniform"

# Spot (On-Demand: 20, Spot: 15, -jr=0.35)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 10000 -ls 1 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e1_spotq15_uniform"

# Spot (On-Demand: 20, Spot: 20, -jr=0.4)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 10000 -ls 1 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e1_spotq20_uniform"
```



## -gr 5000 (Local Steps: -ls 2)

```bash
# FedAvg - 1250 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 5000 -ls 2 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e2_fedavg"

# SCAFFOLD - 1250 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 5000 -ls 2 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 -go "iid_resnet18_e2_scaffold_uniform"

# FedAvg (On-Demand: 20, Spot: 5, -jr=0.25)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 5000 -ls 2 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e2_spotq5_uniform"

# FedAvg (On-Demand: 20, Spot: 10, -jr=0.3)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 5000 -ls 2 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e2_spotq10_uniform"

# FedAvg (On-Demand: 20, Spot: 15, -jr=0.35)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 5000 -ls 2 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e2_spotq15_uniform"

# FedAvg (On-Demand: 20, Spot: 20, -jr=0.4)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 5000 -ls 2 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e2_spotq20_uniform"

```