#!/bin/bash

# Detect the Linux distribution
if [ -f /etc/os-release ]; then
    source /etc/os-release
    DISTRO=$ID
else
    echo "Error: Unable to detect the Linux distribution."
    exit 1
fi

# Update and upgrade based on the detected distribution
case $DISTRO in
    debian|ubuntu)
        sudo apt-get update -y
        sudo apt-get upgrade -y
        sudo apt-get dist-upgrade -y
        sudo apt-get clean
        sudo apt-get autoclean
        sudo apt-get autoremove
        ;;
    arch)
        sudo pacman -Syu --noconfirm
        ;;
    fedora|centos|rhel)
        sudo dnf update -y
        ;;
    *)
        echo "Unsupported Linux distribution: $DISTRO"
        exit 1
        ;;
esac

echo "Update and upgrade completed successfully for $DISTRO."


# sudo tail -f /var/log/apt/term.log