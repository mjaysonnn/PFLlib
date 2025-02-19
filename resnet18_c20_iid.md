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

|  250   | 10 | FedAvg | |
|  250   | 10 | SCAFFOLD | |
|  250  | 10  | Spot(p20_q5) | `Jisoo1`| ✅ 
|  250  | 10  | Spot(p20_q10) | `Jisoo2` | ✅
|  250  | 10  | Spot(p20_q15) | `Jisoo3` | ✅
|  250  | 10  | Spot(p20_q20) | `Jisoo4` | ✅

|  125  | 20 | FedAvg | |
|  125  | 20 | SCAFFOLD | |
|  125  | 20 | Spot(p20_q5) | `Jisoo5`| ✅
|  125  | 20 | Spot(p20_q10) | `View1`| ✅
|  125  | 20 | Spot(p20_q15) |`View2` | ✅
|  125  | 20 | Spot(p20_q20) | `View3`| ✅


## Experiment Commands by Global Rounds

## -gr 250 (Local Epochs: -ls 10)

```bash
# FedAvg - 250 rounds, 10 local steps
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e10_fedavg_stratified"

# SCAFFOLD - 250 rounds, 10 local steps
# python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 250 -ls 10 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 -go "iid_resnet18_e10_scaffold_stratified"

# Spot (On-Demand: 20, Spot: 5, -jr=0.25)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e10_spotq5_stratified"

# Spot (On-Demand: 20, Spot: 10, -jr=0.3)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e10_spotq10_stratified"

# Spot (On-Demand: 20, Spot: 15, -jr=0.35)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e10_spotq15_stratified"

# Spot (On-Demand: 20, Spot: 20, -jr=0.4)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e10_spotq20_stratified"
```


## -gr 125 (Local Epochs: -ls 20)

```bash
# FedAvg - 125 rounds, 20 local steps
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e20_fedavg_stratified"

# SCAFFOLD - 125 rounds, 20 local steps
# python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 125 -ls 20 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 -go "iid_resnet18_e20_scaffold_stratified"

# Spot (On-Demand: 20, Spot: 5, -jr=0.25)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e20_spotq5_c20"

# Spot (On-Demand: 20, Spot: 10, -jr=0.3)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e20_spotq10_stratified"

# Spot (On-Demand: 20, Spot: 15, -jr=0.35)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e20_spotq15_stratified"

# Spot (On-Demand: 20, Spot: 20, -jr=0.4)
# python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e20_spotq20_stratified"
```




<!-- 
### -gr 2500 (Local Steps: -ls 1)
```bash
# FedAvg - 2500 rounds, 1 local step
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e1_fedavg"

# SCAFFOLD - 2500 rounds, 1 local step
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 2500 -ls 1 -nc 100 -jr 0.2 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 -go "iid_resnet18_e1_scaffold"

# Spot (On-Demand: 20, Spot: 5, -jr=0.25)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e1_spotq5"

# Spot (On-Demand: 20, Spot: 10, -jr=0.3)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e1_spotq10"

# Spot (On-Demand: 20, Spot: 15, -jr=0.35)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e1_spotq15"

# Spot (On-Demand: 20, Spot: 20, -jr=0.4)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e1_spotq20"
```






## -gr 1250 (Local Steps: -ls 2)

```bash
# FedAvg - 1250 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e2_fedavg"

# SCAFFOLD - 1250 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 1250 -ls 2 -nc 100 -jr 0.2 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 -go "iid_resnet18_e2_scaffold"

# FedAvg (On-Demand: 20, Spot: 5, -jr=0.25)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e2_spotq5"

# FedAvg (On-Demand: 20, Spot: 10, -jr=0.3)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e2_spotq10"

# FedAvg (On-Demand: 20, Spot: 15, -jr=0.35)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e2_spotq15"

# FedAvg (On-Demand: 20, Spot: 20, -jr=0.4)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e2_spotq20"

```





## -gr 500 (Local Steps: -ls 5)

```bash
# FedAvg - 500 rounds, 5 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 5 -nc 100 -jr 0.2 --on_demand_clients 20 --spot_clients 0 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e5_fedavg"

# SCAFFOLD - 500 rounds, 5 local steps
python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 500 -ls 5 -nc 100 -jr 0.2 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 -go "iid_resnet18_e5_scaffold"

# FedAvg (On-Demand: 20, Spot: 5, -jr=0.25)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 5 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e5_spotq5"

# FedAvg (On-Demand: 20, Spot: 10, -jr=0.3)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 5 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e5_spotq10"

# FedAvg (On-Demand: 20, Spot: 15, -jr=0.35)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 5 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e5_spotq15"

# FedAvg (On-Demand: 20, Spot: 20, -jr=0.4)
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 5 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_resnet18_e5_spotq20"
``` -->




