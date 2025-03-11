# IID Data Generation and Experiment Scripts

## Data Generation

```shell
cd ../dataset
python generate_Cifar10.py noniid - pat
cd ../system
```

## Experiment Setup Table

| Global Rounds | Local Steps | Algorithm |
|--------------|-------------|-----------|
| 250 | 10 | FedAvg |
| 250 | 10 | Spot(p10_q70) |
| 250 | 10 | Spot(p10_q80) |
| 250 | 10 | Spot(p20_q30) |
| 250 | 10 | Spot(p20_q40) |
| 250 | 10 | Spot(p20_q50) |
| 250 | 10 | Spot(p20_q60) |
| 250 | 10 | Spot(p20_q70) |
| 250 | 10 | Spot(p30_q20) |
| 250 | 10 | Spot(p30_q30) |
| 250 | 10 | Spot(p30_q40) |
| 250 | 10 | Spot(p30_q50) |
| 250 | 10 | Spot(p40_q10) |
| 250 | 10 | Spot(p40_q20) |
| 250 | 10 | Spot(p40_q30) |

| Global Rounds | Local Steps | Algorithm |
|--------------|-------------|-----------|
| 125 | 20 |FedAvg | 
| 125 | 20 |Spot(p10_q70) |
| 125 | 20 |Spot(p10_q80) |
| 125 | 20 |Spot(p20_q30) |
| 125 | 20 |Spot(p20_q40) |
| 125 | 20 |Spot(p20_q50) |
| 125 | 20 |Spot(p20_q60) |
| 125 | 20 |Spot(p20_q70) |
| 125 | 20 |Spot(p30_q20) |
| 125 | 20 |Spot(p30_q30) |
| 125 | 20 |Spot(p30_q40) |
| 125 | 20 |Spot(p30_q50) |
| 125 | 20 |Spot(p40_q10) |
| 125 | 20 |Spot(p40_q20) |
| 125 | 20 |Spot(p40_q30) |


### -gr 250 (Local Steps: -ls 10)

```bash
# FedAvg - 250 rounds, 1 local step
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_fedavg"

# Spot configurations with 10 on-demand clients
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 10 --spot_clients 40 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p10q40"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 60 -jr 1.0 --on_demand_clients 10 --spot_clients 50 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p10q50"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 70 -jr 1.0 --on_demand_clients 10 --spot_clients 60 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p10q60"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 80 -jr 1.0 --on_demand_clients 10 --spot_clients 70 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p10q70"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 90 -jr 1.0 --on_demand_clients 10 --spot_clients 80 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p10q80"

# Spot configurations with 20 on-demand clients
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 20 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p20q30"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 60 -jr 1.0 --on_demand_clients 20 --spot_clients 40 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p20q40"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 70 -jr 1.0 --on_demand_clients 20 --spot_clients 50 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p20q50"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 80 -jr 1.0 --on_demand_clients 20 --spot_clients 60 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p20q60"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 90 -jr 1.0 --on_demand_clients 20 --spot_clients 70 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p20q70"

# Spot configurations with 30 on-demand clients
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 30 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p30q20"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 60 -jr 1.0 --on_demand_clients 30 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p30q30"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 70 -jr 1.0 --on_demand_clients 30 --spot_clients 40 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p30q40"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 80 -jr 1.0 --on_demand_clients 30 --spot_clients 50 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p30q50"

# Spot configurations with 40 on-demand clients
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 40 --spot_clients 10 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p40q10"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 60 -jr 1.0 --on_demand_clients 40 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p40q20"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 70 -jr 1.0 --on_demand_clients 40 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p40q30"


```



```bash
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_fedavg" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 10 --spot_clients 40 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p10q40" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 60 -jr 1.0 --on_demand_clients 10 --spot_clients 50 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p10q50" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 70 -jr 1.0 --on_demand_clients 10 --spot_clients 60 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p10q60" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 80 -jr 1.0 --on_demand_clients 10 --spot_clients 70 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p10q70" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 90 -jr 1.0 --on_demand_clients 10 --spot_clients 80 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p10q80" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 20 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p20q30" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 60 -jr 1.0 --on_demand_clients 20 --spot_clients 40 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p20q40" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 70 -jr 1.0 --on_demand_clients 20 --spot_clients 50 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p20q50" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 80 -jr 1.0 --on_demand_clients 20 --spot_clients 60 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p20q60" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 90 -jr 1.0 --on_demand_clients 20 --spot_clients 70 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p20q70" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 30 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p30q20" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 60 -jr 1.0 --on_demand_clients 30 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p30q30" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 70 -jr 1.0 --on_demand_clients 30 --spot_clients 40 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p30q40" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 80 -jr 1.0 --on_demand_clients 30 --spot_clients 50 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p30q50" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 50 -jr 1.0 --on_demand_clients 40 --spot_clients 10 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p40q10" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 60 -jr 1.0 --on_demand_clients 40 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p40q20" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 250 -ls 10 -nc 70 -jr 1.0 --on_demand_clients 40 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e10_pathological_poisson_m50_p40q30"

```

## -gr 125 (Local Steps: -ls 20)

```bash
# FedAvg - 125 rounds, 2 local steps
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_fedavg"

# Spot configurations with 10 on-demand clients
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 10 --spot_clients 40 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p10q40"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 60 -jr 1.0 --on_demand_clients 10 --spot_clients 50 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p10q50"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 70 -jr 1.0 --on_demand_clients 10 --spot_clients 60 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p10q60"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 80 -jr 1.0 --on_demand_clients 10 --spot_clients 70 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p10q70"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 90 -jr 1.0 --on_demand_clients 10 --spot_clients 80 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p10q80"

# Spot configurations with 20 on-demand clients
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 20 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p20q30"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 60 -jr 1.0 --on_demand_clients 20 --spot_clients 40 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p20q40"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 70 -jr 1.0 --on_demand_clients 20 --spot_clients 50 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p20q50"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 80 -jr 1.0 --on_demand_clients 20 --spot_clients 60 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p20q60"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 90 -jr 1.0 --on_demand_clients 20 --spot_clients 70 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p20q70"

# Spot configurations with 30 on-demand clients
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 30 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p30q20"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 60 -jr 1.0 --on_demand_clients 30 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p30q30"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 70 -jr 1.0 --on_demand_clients 30 --spot_clients 40 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p30q40"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 80 -jr 1.0 --on_demand_clients 30 --spot_clients 50 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p30q50"

# Spot configurations with 40 on-demand clients
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 40 --spot_clients 10 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p40q10"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 60 -jr 1.0 --on_demand_clients 40 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p40q20"
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 70 -jr 1.0 --on_demand_clients 40 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p40q30"

```

```bash
python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 50 --spot_clients 0 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_fedavg" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 10 --spot_clients 40 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p10q40" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 60 -jr 1.0 --on_demand_clients 10 --spot_clients 50 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p10q50" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 70 -jr 1.0 --on_demand_clients 10 --spot_clients 60 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p10q60" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 80 -jr 1.0 --on_demand_clients 10 --spot_clients 70 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p10q70" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 90 -jr 1.0 --on_demand_clients 10 --spot_clients 80 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p10q80" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 20 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p20q30" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 60 -jr 1.0 --on_demand_clients 20 --spot_clients 40 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p20q40" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 70 -jr 1.0 --on_demand_clients 20 --spot_clients 50 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p20q50" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 80 -jr 1.0 --on_demand_clients 20 --spot_clients 60 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p20q60" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 90 -jr 1.0 --on_demand_clients 20 --spot_clients 70 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p20q70" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 30 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p30q20" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 60 -jr 1.0 --on_demand_clients 30 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p30q30" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 70 -jr 1.0 --on_demand_clients 30 --spot_clients 40 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p30q40" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 80 -jr 1.0 --on_demand_clients 30 --spot_clients 50 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p30q50" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 50 -jr 1.0 --on_demand_clients 40 --spot_clients 10 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p40q10" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 60 -jr 1.0 --on_demand_clients 40 --spot_clients 20 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p40q20" && python main.py -data Cifar10 -m ResNet18 -algo FedAvg -gr 125 -ls 20 -nc 70 -jr 1.0 --on_demand_clients 40 --spot_clients 30 -lr 0.01 -lbs 32 -go "ResNet18_e20_pathological_poisson_m50_p40q30"

```