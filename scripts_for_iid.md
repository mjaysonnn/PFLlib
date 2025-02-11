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

## FedAvg Experiments (IID Data)

📝 Experiment 1: (gr=2500, ls=1)

Running on View4

```shell

cd dataset || exit
python generate_Cifar10.py iid balance -
cd ../system || exit

python main.py \
    -data Cifar10 \
    -m ResNet18 \
    -algo FedAvg \
    -gr 2500 \
    -ls 1 \
    -nc 100 \
    -jr 0.2 \
    -lr 0.01 \
    -lbs 32 \
    -go "iid_p20_q0_gr2500"
```

🔹 Experiment 2: (gr=1250, ls=2)

Running on View5

```shell

cd dataset || exit
python generate_Cifar10.py iid balance -
cd ../system || exit


python main.py \
    -data Cifar10 \
    -m ResNet18 \
    -algo FedAvg \
    -gr 1250 \
    -ls 2 \
    -nc 100 \
    -jr 0.2 \
    -lr 0.01 \
    -lbs 32 \
    -go "iid_p20_q0_gr1250"
```

🔹 Experiment 3: (gr=500, ls=5)

Running on Jisoo1

```shell

cd dataset || exit
python generate_Cifar10.py iid balance -
cd ../system || exit

python main.py \
    -data Cifar10 \
    -m ResNet18 \
    -algo FedAvg \
    -gr 500 \
    -ls 5 \
    -nc 100 \
    -jr 0.2 \
    -lr 0.01 \
    -lbs 32 \
    -go "iid_p20_q0_gr500"
```

🔹 Experiment 4: (gr=250, ls=10)

Running on Jisoo2

```shell
cd ..
cd dataset || exit
python generate_Cifar10.py iid balance -
cd ../system || exit

python main.py \
    -data Cifar10 \
    -m ResNet18 \
    -algo FedAvg \
    -gr 250 \
    -ls 10 \
    -nc 100 \
    -jr 0.2 \
    -lr 0.01 \
    -lbs 32 \
    -go "iid_p20_q0_gr250"
```

## SCAFFOLD Experiments (IID Data)

📝 Experiment 1: (gr=2500, ls=1)

Running on Jisoo3

```shell
cd ..
cd dataset || exit
python generate_Cifar10.py iid balance -
cd ../system || exit

python main.py \
    -data Cifar10 \
    -m ResNet18 \
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

🔹 Experiment 2: (gr=1250, ls=2)

Running on Jisoo4

```shell
cd ..
cd dataset || exit
python generate_Cifar10.py iid balance -
cd ../system || exit


python main.py \
    -data Cifar10 \
    -m ResNet18 \
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

🔹 Experiment 3: (gr=500, ls=5)

```shell
cd ..
cd dataset || exit
python generate_Cifar10.py iid balance -
cd ../system || exit

python main.py \
    -data Cifar10 \
    -m ResNet18 \
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

🔹 Experiment 4: (gr=250, ls=10)

```shell
cd ..
cd dataset || exit
python generate_Cifar10.py iid balance -
cd ../system || exit

python main.py \
    -data Cifar10 \
    -m ResNet18 \
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

