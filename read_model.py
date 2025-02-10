import torch

file_path = "system/models/Cifar10/FedAvg_server.pt"
checkpoint = torch.load(file_path, map_location=torch.device('cpu'))

# Print out keys to see what it contains
print(checkpoint.keys() if isinstance(checkpoint, dict) else "Contains model object")