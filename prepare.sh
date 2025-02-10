#!/bin/bash

now_path=`pwd`

# Install Miniconda (Silent Installation)
cd
wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O Miniconda.sh
bash Miniconda.sh -b -p $HOME/miniconda

# Add Conda to PATH (Temporary for this session)
export PATH="$HOME/miniconda/bin:$PATH"

# Initialize Conda (Required before using `conda activate`)
conda init
source ~/.bashrc  # Reload shell to apply Conda settings

# Configure ~/.bashrc
echo alias p=\"ps -aux|grep zhangjq|grep 'python -u'\" >> ~/.bashrc
echo alias n=\'nvidia-smi\' >> ~/.bashrc
echo alias d=\'du -hs * | sort -h\' >> ~/.bashrc
echo alias del_pycache=\'find . -type d -name __pycache__ -prune -exec rm -rf {} \;\' >> ~/.bashrc

echo export PIP_CACHE_DIR='$PWD'/tmp >> ~/.bashrc
echo export TMPDIR='$PWD'/tmp >> ~/.bashrc

# Install Python packages
cd $now_path
source ~/.bashrc  # Ensure changes take effect
conda env create -f env_cuda_latest.yaml

# Activate Conda environment
conda activate pfllib