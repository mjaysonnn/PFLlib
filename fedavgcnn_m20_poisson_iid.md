# IID Data Generation and Experiment Scripts

## Data Generation

```shell
cd ../dataset
python generate_Cifar10.py iid balance -
cd ../system
```

## Experiment Setup Table

| Global Rounds | Local Steps | Algorithm |
|--------------|-------------|-----------|
| 250 | 10 | FedAvg | 
| 250 | 10 | Spot(p5_q20) |
| 250 | 10 | Spot(p5_q30) |
| 250 | 10 | Spot(p5_q40) |
| 250 | 10 | Spot(p10_q10) |
| 250 | 10 | Spot(p10_q20) |
| 250 | 10 | Spot(p10_q30) |
| 250 | 10 | Spot(p15_q10) |
| 250 | 10 | Spot(p15_q20) |
| 250 | 10 | Spot(p15_q30) |

| Global Rounds | Local Steps | Algorithm |
|--------------|-------------|-----------|
| 125 | 20 | FedAvg | 
| 125 | 20 | Spot(p5_q20) |
| 125 | 20 | Spot(p5_q30) |
| 125 | 20 | Spot(p5_q40) |
| 125 | 20 | Spot(p10_q10) |
| 125 | 20 | Spot(p10_q20) |
| 125 | 20 | Spot(p10_q30) |
| 125 | 20 | Spot(p15_q10) |
| 125 | 20 | Spot(p15_q20) |
| 125 | 20 | Spot(p15_q30) |



### -gr 250 (Local Steps: -ls 10 )

```bash
# FedAvg - 250 rounds, 10 local step
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 10  -nc 20 -jr 1.0 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "FedAvgCNN_e10_iid_poisson_m20_fedavg"

# Spot(p5_q20) - 250 rounds, 10 local step
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 10  -nc 25 -jr 1.0 --on_demand_clients 5 --spot_clients 20 -lr 0.01 -lbs 32 -go "FedAvgCNN_e10_iid_poisson_m20_p5q20"

# Spot(p5_q30) - 250 rounds, 10 local step
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 10  -nc 35 -jr 1.0 --on_demand_clients 5 --spot_clients 30 -lr 0.01 -lbs 32 -go "FedAvgCNN_e10_iid_poisson_m20_p5q30"

# Spot(p5_q40) - 250 rounds, 10 local step
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 10  -nc 45 -jr 1.0 --on_demand_clients 5 --spot_clients 40 -lr 0.01 -lbs 32 -go "FedAvgCNN_e10_iid_poisson_m20_p5q40"

# Spot(p10_q10) - 250 rounds, 10 local step
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 10  -nc 20 -jr 1.0 --on_demand_clients 10 --spot_clients 10 -lr 0.01 -lbs 32 -go "FedAvgCNN_e10_iid_poisson_m20_p10q10"

# Spot(p10_q20) - 250 rounds, 10 local step
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 10  -nc 30 -jr 1.0 --on_demand_clients 10 --spot_clients 20 -lr 0.01 -lbs 32 -go "FedAvgCNN_e10_iid_poisson_m20_p10q20"

# Spot(p10_q30) - 250 rounds, 10 local step
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 10  -nc 40 -jr 1.0 --on_demand_clients 10 --spot_clients 30 -lr 0.01 -lbs 32 -go "FedAvgCNN_e10_iid_poisson_m20_p10q30"

# Spot(p15_q10) - 250 rounds, 10 local step
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 10  -nc 25 -jr 1.0 --on_demand_clients 15 --spot_clients 10 -lr 0.01 -lbs 32 -go "FedAvgCNN_e10_iid_poisson_m20_p15q10"

# Spot(p15_q20) - 250 rounds, 10 local step
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 10  -nc 35 -jr 1.0 --on_demand_clients 15 --spot_clients 20 -lr 0.01 -lbs 32 -go "FedAvgCNN_e10_iid_poisson_m20_p15q20"

# Spot(p15_q30) - 250 rounds, 10 local step
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 10  -nc 45 -jr 1.0 --on_demand_clients 15 --spot_clients 30 -lr 0.01 -lbs 32 -go "FedAvgCNN_e10_iid_poisson_m20_p15q30"

```



```bash
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 10  -nc 20 -jr 1.0 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "FedAvgCNN_e10_iid_poisson_m20_fedavg" && python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 10  -nc 25 -jr 1.0 --on_demand_clients 5 --spot_clients 20 -lr 0.01 -lbs 32 -go "FedAvgCNN_e10_iid_poisson_m20_p5q20" && python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 10  -nc 35 -jr 1.0 --on_demand_clients 5 --spot_clients 30 -lr 0.01 -lbs 32 -go "FedAvgCNN_e10_iid_poisson_m20_p5q30" && python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 10  -nc 45 -jr 1.0 --on_demand_clients 5 --spot_clients 40 -lr 0.01 -lbs 32 -go "FedAvgCNN_e10_iid_poisson_m20_p5q40" && python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 10  -nc 20 -jr 1.0 --on_demand_clients 10 --spot_clients 10 -lr 0.01 -lbs 32 -go "FedAvgCNN_e10_iid_poisson_m20_p10q10" && python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 10  -nc 30 -jr 1.0 --on_demand_clients 10 --spot_clients 20 -lr 0.01 -lbs 32 -go "FedAvgCNN_e10_iid_poisson_m20_p10q20" && python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 10  -nc 40 -jr 1.0 --on_demand_clients 10 --spot_clients 30 -lr 0.01 -lbs 32 -go "FedAvgCNN_e10_iid_poisson_m20_p10q30" && python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 10  -nc 25 -jr 1.0 --on_demand_clients 15 --spot_clients 10 -lr 0.01 -lbs 32 -go "FedAvgCNN_e10_iid_poisson_m20_p15q10" && python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 10  -nc 35 -jr 1.0 --on_demand_clients 15 --spot_clients 20 -lr 0.01 -lbs 32 -go "FedAvgCNN_e10_iid_poisson_m20_p15q20" && python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 250 -ls 10  -nc 45 -jr 1.0 --on_demand_clients 15 --spot_clients 30 -lr 0.01 -lbs 32 -go "FedAvgCNN_e10_iid_poisson_m20_p15q30" 
```

## -gr 125 (Local Steps: -ls 20)

```bash
# FedAvg - 125 rounds, 20 local steps
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 125 -ls 20 -nc 20 -jr 1.0 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "FedAvgCNN_e20_iid_poisson_m20_fedavg"

# Spot(p5_q20) - 125 rounds, 20 local steps
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 125 -ls 20 -nc 25 -jr 1.0 --on_demand_clients 5 --spot_clients 20 -lr 0.01 -lbs 32 -go "FedAvgCNN_e20_iid_poisson_m20_p5q20"

# Spot(p5_q30) - 125 rounds, 20 local steps
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 125 -ls 20 -nc 35 -jr 1.0 --on_demand_clients 5 --spot_clients 30 -lr 0.01 -lbs 32 -go "FedAvgCNN_e20_iid_poisson_m20_p5q30"

# Spot(p5_q40) - 125 rounds, 20 local steps
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 125 -ls 20 -nc 45 -jr 1.0 --on_demand_clients 5 --spot_clients 40 -lr 0.01 -lbs 32 -go "FedAvgCNN_e20_iid_poisson_m20_p5q40"

# Spot(p10_q10) - 125 rounds, 20 local steps
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 125 -ls 20 -nc 20 -jr 1.0 --on_demand_clients 10 --spot_clients 10 -lr 0.01 -lbs 32 -go "FedAvgCNN_e20_iid_poisson_m20_p10q10"

# Spot(p10_q20) - 125 rounds, 20 local steps
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 125 -ls 20 -nc 30 -jr 1.0 --on_demand_clients 10 --spot_clients 20 -lr 0.01 -lbs 32 -go "FedAvgCNN_e20_iid_poisson_m20_p10q20"

# Spot(p10_q30) - 125 rounds, 20 local steps
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 125 -ls 20 -nc 40 -jr 1.0 --on_demand_clients 10 --spot_clients 30 -lr 0.01 -lbs 32 -go "FedAvgCNN_e20_iid_poisson_m20_p10q30"

# Spot(p15_q10) - 125 rounds, 20 local steps
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 125 -ls 20 -nc 25 -jr 1.0 --on_demand_clients 15 --spot_clients 10 -lr 0.01 -lbs 32 -go "FedAvgCNN_e20_iid_poisson_m20_p15q10"

# Spot(p15_q20) - 125 rounds, 20 local steps
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 125 -ls 20 -nc 35 -jr 1.0 --on_demand_clients 15 --spot_clients 20 -lr 0.01 -lbs 32 -go "FedAvgCNN_e20_iid_poisson_m20_p15q20"

# Spot(p15_q30) - 125 rounds, 20 local steps
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 125 -ls 20 -nc 45 -jr 1.0 --on_demand_clients 15 --spot_clients 30 -lr 0.01 -lbs 32 -go "FedAvgCNN_e20_iid_poisson_m20_p15q30"
```

```bash
python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 125 -ls 20 -nc 20 -jr 1.0 --on_demand_clients 20 --spot_clients 0 -lr 0.01 -lbs 32 -go "FedAvgCNN_e20_iid_poisson_m20_fedavg" && python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 125 -ls 20 -nc 25 -jr 1.0 --on_demand_clients 5 --spot_clients 20 -lr 0.01 -lbs 32 -go "FedAvgCNN_e20_iid_poisson_m20_p5q20" && python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 125 -ls 20 -nc 35 -jr 1.0 --on_demand_clients 5 --spot_clients 30 -lr 0.01 -lbs 32 -go "FedAvgCNN_e20_iid_poisson_m20_p5q30" && python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 125 -ls 20 -nc 45 -jr 1.0 --on_demand_clients 5 --spot_clients 40 -lr 0.01 -lbs 32 -go "FedAvgCNN_e20_iid_poisson_m20_p5q40" && python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 125 -ls 20 -nc 20 -jr 1.0 --on_demand_clients 10 --spot_clients 10 -lr 0.01 -lbs 32 -go "FedAvgCNN_e20_iid_poisson_m20_p10q10" && python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 125 -ls 20 -nc 30 -jr 1.0 --on_demand_clients 10 --spot_clients 20 -lr 0.01 -lbs 32 -go "FedAvgCNN_e20_iid_poisson_m20_p10q20" && python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 125 -ls 20 -nc 40 -jr 1.0 --on_demand_clients 10 --spot_clients 30 -lr 0.01 -lbs 32 -go "FedAvgCNN_e20_iid_poisson_m20_p10q30" && python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 125 -ls 20 -nc 25 -jr 1.0 --on_demand_clients 15 --spot_clients 10 -lr 0.01 -lbs 32 -go "FedAvgCNN_e20_iid_poisson_m20_p15q10" && python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 125 -ls 20 -nc 35 -jr 1.0 --on_demand_clients 15 --spot_clients 20 -lr 0.01 -lbs 32 -go "FedAvgCNN_e20_iid_poisson_m20_p15q20" && python main.py -data Cifar10 -m FedAvgCNN -algo FedAvg -gr 125 -ls 20 -nc 45 -jr 1.0 --on_demand_clients 15 --spot_clients 30 -lr 0.01 -lbs 32 -go "FedAvgCNN_e20_iid_poisson_m20_p15q30"

```