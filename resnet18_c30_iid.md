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

| Global Rounds (`-gr`) | Local Steps (`-ls`) | Algorithm | Run Name  |
|-----------------------|--------------------|------------|------------|
|  2500  | 1  | FedAvg | `Jisoo5` (Done) |
|  2500  | 1  | SCAFFOLD | `View1` (Done)|
|  2500  | 1  | Spot(p30_q5) | `Jisoo1` (Done) |
|  2500  | 1  | Spot(p30_q10) | `View3` (DOne) |
|  2500  | 1  | Spot(p30_q15) | `View4` (DOne) |
|  2500  | 1  | Spot(p30_q20) | `Jisoo2` (Done)|

|  1250  | 2  | FedAvg | `View5` (Done)|
|  1250  | 2  | SCAFFOLD | `View2` (Done) |
|  1250  | 2  | Spot(p30_q5) | `Jisoo3` (Done) |
|  1250  | 2  | Spot(p30_q10) | `Jisoo4` (Done) |
|  🟢 1250  | 2  | Spot(p30_q15) | `Jisoo5` |
|  🟢 1250  | 2  | Spot(p30_q20) | `View1`|

|  🟢 500  | 5  | FedAvg | `Jisoo1` |
|  🟢 500  | 5  | SCAFFOLD | `View3` |
|  🟢 500  | 5  | Spot(p30_q5) | `View4` |
|  🟢 500  | 5  | Spot(p30_q10) | `Jisoo2` |
|  🟢 500  | 5  | Spot(p30_q15) | `View5` |
|  🟢 500  | 5  | Spot(p30_q20) | `View2` |

|  🟢 250  | 10 | FedAvg | `Jisoo3` |
|  250  | 10 | SCAFFOLD | `Jisoo4` (Done) |
|  🟢 250  | 10  | Spot(p30_q5) | `Jisoo4` |
|  250  | 10  | Spot(p30_q10) | |
|  250  | 10  | Spot(p30_q15) | |
|  250  | 10  | Spot(p30_q20) | |






## Experiment Commands by Global Rounds


### -gr 2500 (Local Steps: -ls 1)
```bash
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0 -bt 0.5 -lr 0.01 -lbs 32 --goal "iid_resnet18_e1_fedavg_c30"

python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 2500 -ls 1 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 --goal "iid_resnet18_e1_scaffold_c30"

python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.35 --on_demand_clients 30 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 --goal "iid_resnet18_e1_spotq5_c30"

python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.4 --on_demand_clients 30 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 --goal "iid_resnet18_e1_spotq10_c30"

python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.45 --on_demand_clients 30 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 --goal "iid_resnet18_e1_spotq15_c30"

python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.5 --on_demand_clients 30 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 --goal "iid_resnet18_e1_spotq20_c30"
```






## -gr 1250 (Local Steps: -ls 2)

```bash
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0 -bt 0.5 -lr 0.01 -lbs 32 --goal "iid_resnet18_e2_fedavg_c30"

python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 1250 -ls 2 -nc 100 -jr 0.3  --on_demand_clients 30 --spot_clients 0 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 --goal "iid_resnet18_e2_scaffold_c30"

python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.35 --on_demand_clients 30 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 --goal "iid_resnet18_e2_spotq5_c30"

python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.4 --on_demand_clients 30 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 --goal "iid_resnet18_e2_spotq10_c30"

python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.45 --on_demand_clients 30 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 --goal "iid_resnet18_e2_spotq15_c30"

python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.5 --on_demand_clients 30 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 --goal "iid_resnet18_e2_spotq20_c30"
```





## -gr 500 (Local Steps: -ls 5)

```bash
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 5 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0 -bt 0.5 -lr 0.01 -lbs 32 --goal "iid_resnet18_e5_fedavg_c30"

python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 500 -ls 5 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 --goal "iid_resnet18_e5_scaffold_c30"

python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 5 -nc 100 -jr 0.35 --on_demand_clients 30 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 --goal "iid_resnet18_e5_spotq5_c30"

python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 5 -nc 100 -jr 0.4 --on_demand_clients 30 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 --goal "iid_resnet18_e5_spotq10_c30"

python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 5 -nc 100 -jr 0.45 --on_demand_clients 30 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 --goal "iid_resnet18_e5_spotq15_c30"

python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 500 -ls 5 -nc 100 -jr 0.5 --on_demand_clients 30 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 --goal "iid_resnet18_e5_spotq20_c30"
```




## -gr 250 (Local Steps: -ls 10)

```bash
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0 -bt 0.5 -lr 0.01 -lbs 32 --goal "iid_resnet18_e10_fedavg_c30"

python main.py -data Cifar10 -m ResNet18 -algo SCAFFOLD -gr 250 -ls 10 -nc 100 -jr 0.3 --on_demand_clients 30 --spot_clients 0 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 --goal "iid_resnet18_e10_scaffold_c30"

python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.35 --on_demand_clients 30 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 --goal "iid_resnet18_e10_spotq5_c30"

python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.4 --on_demand_clients 30 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 --goal "iid_resnet18_e10_spotq10_c30"

python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.45 --on_demand_clients 30 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 --goal "iid_resnet18_e10_spotq15_c30"

python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.5 --on_demand_clients 30 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 --goal "iid_resnet18_e10_spotq20_c30"
```
