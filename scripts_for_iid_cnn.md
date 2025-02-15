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

| Global Rounds (`-gr`) | Local Steps (`-ls`) | Algorithm | Server |
|-----------------------|--------------------|------------|--------|
| 🟢 2500  | 1  | FedAvg |  |
| 🟢 2500  | 1  | SCAFFOLD |  |
| 🟢 2500  | 1  | Spot(p20_q5) |  |
| 🟢 2500  | 1  | Spot(p20_q10) |  |
| 🔵 2500  | 1  | Spot(p20_q15) |  |
| 🔵 2500  | 1  | Spot(p20_q20) |  |
| 🟢 1250  | 2  | FedAvg |  |
| 🟢 1250  | 2  | SCAFFOLD |  |
| 🔵 1250  | 2  | Spot(p20_q5) |  |
| 🔵 1250  | 2  | Spot(p20_q10) |  |
| 🔵 1250  | 2  | Spot(p20_q15) |  |
| 🔵 1250  | 2  | Spot(p20_q20) |  |
| 🟢 500   | 5  | FedAvg |  |
| 🟢 500   | 5  | SCAFFOLD |  |
| 🟢 500   | 5  | Spot(p20_q5) |  |
| 🟢 500   | 5  | Spot(p20_q10) |  |
| 🟢 500   | 5  | Spot(p20_q15) |  |
| 🔵 500   | 5  | Spot(p20_q20) |  |
| 🟢 250   | 10 | FedAvg |  |
| 🟢 250   | 10 | SCAFFOLD |  |
| 🔵 250   | 10 | Spot(p20_q5) |  |
| 🔵 250   | 10 | Spot(p20_q10) |  |
| 🔵 250   | 10 | Spot(p20_q15) |  |
| 🔵 250   | 10 | Spot(p20_q20) |  |

## Experiment Commands by Global Rounds



## -gr 2500 (Local Steps: -ls 1)
# FedAvg - 2500 rounds, 1 local step
```bash
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.2 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_cnn_p20_q0_r2500"
```
# SCAFFOLD - 2500 rounds, 1 local step
```bash
python main.py -data Cifar10 -m CNN -algo SCAFFOLD -gr 2500 -ls 1 -nc 100 -jr 0.2 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 -go "iid_cnn_p20_q0_r2500"
```
# Spot configurations
```bash
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_cnn_p20_q5_r2500"
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_cnn_p20_q10_r2500"
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_cnn_p20_q15_r2500"
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 2500 -ls 1 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_cnn_p20_q20_r2500"
```

## -gr 1250 (Local Steps: -ls 2)
```bash
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.2 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_cnn_p20_q0_r1250"
python main.py -data Cifar10 -m CNN -algo SCAFFOLD -gr 1250 -ls 2 -nc 100 -jr 0.2 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 -go "iid_cnn_p20_q0_r1250"
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_cnn_p20_q5_r1250"
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_cnn_p20_q10_r1250"
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_cnn_p20_q15_r1250"
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 1250 -ls 2 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_cnn_p20_q20_r1250"
```

## -gr 500 (Local Steps: -ls 5)
```bash
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 500 -ls 5 -nc 100 -jr 0.2 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_cnn_p20_q0_r500"
python main.py -data Cifar10 -m CNN -algo SCAFFOLD -gr 500 -ls 5 -nc 100 -jr 0.2 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 -go "iid_cnn_p20_q0_r500"
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 500 -ls 5 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_cnn_p20_q5_r500"
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 500 -ls 5 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_cnn_p20_q10_r500"
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 500 -ls 5 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_cnn_p20_q15_r500"
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 500 -ls 5 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_cnn_p20_q20_r500"
```

## -gr 250 (Local Steps: -ls 10)
```bash
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.2 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_cnn_p20_q0_r250"
python main.py -data Cifar10 -m CNN -algo SCAFFOLD -gr 250 -ls 10 -nc 100 -jr 0.2 -bt 0.5 -lr 0.01 -slr 1.0 -lbs 32 -go "iid_cnn_p20_q0_r250"
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.25 --on_demand_clients 20 --spot_clients 5 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_cnn_p20_q5_r250"
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.3 --on_demand_clients 20 --spot_clients 10 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_cnn_p20_q10_r250"
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.35 --on_demand_clients 20 --spot_clients 15 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_cnn_p20_q15_r250"
python main.py -data Cifar10 -m CNN -algo FedAvg -gr 250 -ls 10 -nc 100 -jr 0.4 --on_demand_clients 20 --spot_clients 20 -bt 0.5 -lr 0.01 -lbs 32 -go "iid_cnn_p20_q20_r250"
```