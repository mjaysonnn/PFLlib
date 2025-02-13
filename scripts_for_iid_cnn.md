# IID Data Generation and Experiment Scripts

## Data Generation

```shell
cd dataset
python generate_Cifar10.py iid balance -
cd ../system
```

- iid → Ensures the dataset is split independently and identically across all clients.
- balance → Ensures each client receives approximately the same amount of data.
- "-" → No specific partition method needed (as it’s IID).

## Experiment 1 FedAvg, gr=2500, ls=1

### Jisoo5

```shell
cd ..
cd dataset 
python generate_Cifar10.py iid balance -
cd ../system 

python main.py \
    -data Cifar10 \
    -m CNN \
    -algo FedAvg \
    -gr 2500 \
    -ls 1 \
    -nc 100 \
    -jr 0.2 \
    -lr 0.01 \
    -lbs 32 \
    -go "iid_fedavg_p20_q0_gr2500"
```

## Experiment 2 Scaffold, gr=2500, ls=1

### View4

```shell
cd ..
cd dataset
python generate_Cifar10.py iid balance -
cd ../system


python main.py \
    -data Cifar10 \
    -m CNN \
    -algo SCAFFOLD \
    -gr 2500 \
    -ls 1 \
    -nc 100 \
    -jr 0.2 \
    -lr 0.01 \
    -slr 1.0 \
    -lbs 32 \
    -go "iid_scaffold_p20_q0_gr2500"
```

## Experiment 3 FedAvg, gr=1250, ls=2

### View5

```shell
cd ..
cd dataset 
python generate_Cifar10.py iid balance -
cd ../system 


python main.py \
    -data Cifar10 \
    -m CNN \
    -algo FedAvg \
    -gr 1250 \
    -ls 2 \
    -nc 100 \
    -jr 0.2 \
    -lr 0.01 \
    -lbs 32 \
    -go "iid_fedavg_p20_q0_gr1250"
```

## Experiment 4 Scaffold, gr=1250, ls=2

### View3

```shell
cd ..
cd dataset 
python generate_Cifar10.py iid balance -
cd ../system 

python main.py \
    -data Cifar10 \
    -m CNN \
    -algo SCAFFOLD \
    -gr 1250 \
    -ls 2 \
    -nc 100 \
    -jr 0.2 \
    -lr 0.01 \
    -slr 1.0 \
    -lbs 32 \
    -go "iid_scaffold_p20_q0_gr1250"
```

## Experiment 5 FedAvg, gr = 500, ls = 5

### View2


```shell

cd dataset 
python generate_Cifar10.py iid balance -
cd ../system 

python main.py \
    -data Cifar10 \
    -m CNN \
    -algo FedAvg \
    -gr 500 \
    -ls 5 \
    -nc 100 \
    -jr 0.2 \
    -lr 0.01 \
    -lbs 32 \
    -go "iid_fedavg_p20_q0_gr500"
```

## Experiment 6 Scaffold, gr=500, ls=5

### Jisoo1

```shell
cd ..
cd dataset 
python generate_Cifar10.py iid balance -
cd ../system 

python main.py \
    -data Cifar10 \
    -m CNN \
    -algo SCAFFOLD \
    -gr 500 \
    -ls 5 \
    -nc 100 \
    -jr 0.2 \
    -lr 0.01 \
    -slr 1.0 \
    -lbs 32 \
    -go "iid_scaffold_p20_q0_gr500"
```


## Experiment 7 FedAvg, gr=250, ls=10

### View1

```shell
cd ..
cd dataset 
python generate_Cifar10.py iid balance -
cd ../system 

python main.py \
    -data Cifar10 \
    -m CNN \
    -algo FedAvg \
    -gr 250 \
    -ls 10 \
    -nc 100 \
    -jr 0.2 \
    -lr 0.01 \
    -lbs 32 \
    -go "iid_fedavg_p20_q0_gr250"
```

## Experiment 8 Scaffold, gr=250, ls=10

### 

```shell
cd ..
cd dataset 
python generate_Cifar10.py iid balance -
cd ../system 


python main.py \
    -data Cifar10 \
    -m CNN \
    -algo SCAFFOLD \
    -gr 250 \
    -ls 10 \
    -nc 100 \
    -jr 0.2 \
    -lr 0.01 \
    -slr 1.0 \
    -lbs 32 \
    -go "iid_scaffold_p20_q0_gr250"
```
