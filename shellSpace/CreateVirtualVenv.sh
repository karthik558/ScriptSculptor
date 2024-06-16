#!/bin/bash

# Install python3-venv if not already installed
sudo apt install python3-venv

# Create a directory for the virtual environment
mkdir ~/VirtualEnv

# Create a Python virtual environment
python3 -m venv ~/VirtualEnv

# Prompt the user to activate the virtual environment
read -p "Do you want to activate the virtual environment? (y/n): " choice

if [ "$choice" == "y" ]; then
    source ~/VirtualEnv/bin/activate
    echo "Virtual environment activated!"
else
    echo "Exiting the script."
fi
