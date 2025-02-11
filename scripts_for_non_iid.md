
## Data Generation

```shell
cd dataset
python generate_Cifar10.py noniid unbalance dir
cd ../system
```


## FedAvg

📝 Experiment 1: (gr=2500, ls=1)

This is the reference setting with 2500 global rounds and 1 local epoch.

- Running Jisoo1

```shell
python main.py \
    -data Cifar10 \
    -m ResNet18 \
    -algo FedAvg \
    -gr 2500 \
    -ls 1 \
    -nc 100 \
    -jr 0.2 \
    -bt 0.5 \
    -lr 0.01 \
    -lbs 32 \
    -go "dir_p20_q0_gr2500"
```

🔹 Experiment 2: gr = 1250, ls = 2


```shell
python main.py \
    -data Cifar10 \
    -m ResNet18 \
    -algo FedAvg \
    -gr 1250 \
    -ls 2 \
    -nc 100 \
    -jr 0.2 \
    -bt 0.5 \
    -lr 0.01 \
    -lbs 32 \
    -go "dir_p20_q0_gr1250"
```

🔹 Experiment 3: gr = 500, ls = 5

```shell
python main.py \
    -data Cifar10 \
    -m ResNet18 \
    -algo FedAvg \
    -gr 500 \
    -ls 5 \
    -nc 100 \
    -jr 0.2 \
    -bt 0.5 \
    -lr 0.01 \
    -lbs 32 \
    -go "dir_p20_q0_gr500"
```
￼

🔹 Experiment 4: gr = 250, ls = 10

```shell
python main.py \
    -data Cifar10 \
    -m ResNet18 \
    -algo FedAvg \
    -gr 250 \
    -ls 10 \
    -nc 100 \
    -jr 0.2 \
    -bt 0.5 \
    -lr 0.01 \
    -lbs 32 \
    -go "dir_p20_q0_gr250"
```

## SCAFFOLD Experiments (Non-IID Data)

📝 Experiment 1: (gr=2500, ls=1)

Jisoo5

```shell
python main.py \
    -data Cifar10 \
    -m ResNet18 \
    -algo SCAFFOLD \
    -gr 2500 \
    -ls 1 \
    -nc 100 \
    -jr 0.2 \
    -bt 0.5 \
    -lr 0.01 \
    -slr 1.0 \
    -lbs 32 \
    -go "scaffold_p20_q0_gr2500"
```

🔹 Experiment 2: (gr=1250, ls=2)

```shell
python main.py \
    -data Cifar10 \
    -m ResNet18 \
    -algo SCAFFOLD \
    -gr 1250 \
    -ls 2 \
    -nc 100 \
    -jr 0.2 \
    -bt 0.5 \
    -lr 0.01 \
    -slr 1.0 \
    -lbs 32 \
    -go "scaffold_p20_q0_gr1250"
```

🔹 Experiment 3: (gr=500, ls=5)

```shell
python main.py \
    -data Cifar10 \
    -m ResNet18 \
    -algo SCAFFOLD \
    -gr 500 \
    -ls 5 \
    -nc 100 \
    -jr 0.2 \
    -bt 0.5 \
    -lr 0.01 \
    -slr 1.0 \
    -lbs 32 \
    -go "scaffold_p20_q0_gr500"
```

🔹 Experiment 4: (gr=250, ls=10)

```shell
python main.py \
    -data Cifar10 \
    -m ResNet18 \
    -algo SCAFFOLD \
    -gr 250 \
    -ls 10 \
    -nc 100 \
    -jr 0.2 \
    -bt 0.5 \
    -lr 0.01 \
    -slr 1.0 \
    -lbs 32 \
    -go "scaffold_p20_q0_gr250"
```



