#!/bin/bash

# Prompt the user for the desired swap size
read -p "Enter the swap size in gigabytes (e.g., 2): " swap_size

# Validate the input (must be a positive integer)
if ! [[ "$swap_size" =~ ^[1-9][0-9]*$ ]]; then
    echo "Invalid input. Please enter a positive integer."
    exit 1
fi

# Calculate the swap size in megabytes
swap_size_mb=$((swap_size * 1024))

echo "Checking the System for Swap Information"
sudo swapon --show && free -h

echo "Checking Available Space on the Hard Drive Partition"
df -h

echo "Creating a Swap File of ${swap_size}GB"
sudo fallocate -l ${swap_size}G /swapfile
ls -lh /swapfile

echo "Enabling the Swap File"
sudo chmod 600 /swapfile
ls -lh /swapfile

sudo mkswap /swapfile
sudo swapon /swapfile
sudo swapon --show

free -h

echo "Making the Swap File Permanent"
sudo cp /etc/fstab /etc/fstab.bak
echo "/swapfile none swap sw 0 0" | sudo tee -a /etc/fstab

echo "Tuning your Swap Settings"
echo "For Adjusting the Swappiness Property"

cat /proc/sys/vm/swappiness
sudo sysctl vm.swappiness=10

# ---- Important ---- #
# sudo nano /etc/sysctl.conf
# vm.swappiness=10 -- add this to the bottom

cat /proc/sys/vm/vfs_cache_pressure
sudo sysctl vm.vfs_cache_pressure=50

# ---- Important ---- #
# sudo nano /etc/sysctl.conf
# vm.vfs_cache_pressure=50
