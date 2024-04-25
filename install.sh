#!/bin/bash

# Exit script on any error
set -e

# Check if the script is run as root, exit if not
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Function to add NOPASSWD entry to sudoers
add_nopasswd_sudo() {
    echo "Adding NOPASSWD entry to /etc/sudoers for user $1"
    echo "$1 ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
}

# Get the current logged-in user's username
username=$(whoami)

# Adding NOPASSWD entry for the user
add_nopasswd_sudo $username

echo "Please open a new terminal and test if 'sudo su' works without a password."
read -p "Press enter to continue if 'sudo su' is working without a password..."

# Update and upgrade the system packages
echo "Updating and upgrading system packages..."
sudo apt update && sudo apt full-upgrade -y

# Clone the GitHub repository
echo "Cloning the ippsec-ansible-pwnbox repository..."
git clone https://github.com/zer0dac/ippsec-ansible-pwnbox-latest.git

# Change directory
cd ippsec-ansible-pwnbox-latest/parrot-build

# Install Ansible
echo "Installing Ansible..."
pip3 install ansible --break-system-packages

# Install required Ansible roles
echo "Installing required Ansible roles..."
ansible-galaxy install -r requirements.yml

# Run Ansible playbook
echo "Running Ansible playbook..."
ansible-playbook main.yml

echo "Installation complete!"
