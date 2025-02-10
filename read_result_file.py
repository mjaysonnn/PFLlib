import h5py
import numpy as np

file_path = "./results/Cifar10_FedAvg_test_0.h5"

with h5py.File(file_path, 'r') as hf:
    print("Keys in the file:", list(hf.keys()))  # List all stored datasets

    if 'rs_train_loss' in hf:
        train_loss = np.array(hf['rs_train_loss'])
        print("Train Loss:", train_loss)
        print("Number of Train Loss values:", len(train_loss))
    else:
        print("Train Loss not found.")

    if 'rs_test_acc' in hf:
        test_acc = np.array(hf['rs_test_acc'])
        print("Test Accuracy:", test_acc)
        print("Number of Test Accuracy values:", len(test_acc))
    else:
        print("Test Accuracy not found.")