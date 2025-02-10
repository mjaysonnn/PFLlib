
## Data Generation

```shell
python generate_Cifar10.py noniid unbalance dir
```


## FedAvg

📝 Experiment 1: (gr=2500, ls=1)

This is the reference setting with 2500 global rounds and 1 local epoch.

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
    -lbs 64 \
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
    -lbs 64 \
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
    -lbs 64 \
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
    -lbs 64 \
    -go "dir_p20_q0_gr250"
```

￼


| **Experiment**     | **Global Rounds (gr)** | **Local Epochs (ls)** | **Total Iterations** |
|-------------------|----------------------|----------------------|----------------------|
| **Baseline**      | 2500                 | 1                    | 2500                 |
| **Experiment 1**  | 1250                 | 2                    | 2500                 |
| **Experiment 2**  | 500                  | 5                    | 2500                 |
| **Experiment 3**  | 250                  | 10                   | 2500                 |


## SCAFFOLD Experiments (Varying Global Rounds & Local Epochs)

📝 Experiment 1: (gr=2500, ls=1)


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
    -lbs 64 \
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
    -lbs 64 \
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
    -lbs 64 \
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
    -lbs 64 \
    -go "scaffold_p20_q0_gr250"
```

### Key Changes for SCAFFOLD:

- Added -algo SCAFFOLD
-  Explicitly set -slr 1.0 for server learning rate
- Kept -lr 0.01 for client learning rate
- Ensured same iteration count across experiments (gr * ls = 2500)

