import torch
import sys
import os

# Add the directory containing 'flcore' to Python's path
sys.path.append(os.path.abspath(os.path.join(os.getcwd(), "system")))

file_path = "system/models/Cifar10/FedAvg_server.pt"

# Load the checkpoint
checkpoint = torch.load(file_path, map_location=torch.device('cpu'))

# Check if checkpoint is a dictionary or a model
if isinstance(checkpoint, dict):
    print("Checkpoint Keys:", checkpoint.keys())

    # If model state exists
    if "model_state_dict" in checkpoint:
        print("Model state_dict found.")

    # Print additional stored configurations
    print("Global Rounds:", checkpoint.get("round", "N/A"))
    print("Local Epochs:", checkpoint.get("local_epochs", "N/A"))
    print("Learning Rate:", checkpoint.get("learning_rate", "N/A"))
    print("Batch Size:", checkpoint.get("batch_size", "N/A"))
    print("Server LR:", checkpoint.get("server_learning_rate", "N/A"))

elif isinstance(checkpoint, torch.nn.Module):
    print(f"Loaded a model of type: {type(checkpoint)}")
    print("Model architecture:", checkpoint)
else:
    print(f"Unknown checkpoint format: {type(checkpoint)}")