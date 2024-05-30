#!/usr/bin/env python3

import paramiko
import time

try:
    import paramiko
except ImportError:
    print("The 'paramiko' library is not installed. Aborting.")
    exit(1)

# Get the current date as a string in the format YYYY-MM-DD
date = time.strftime("%Y-%m-%d")

# Change these variables to match your network configuration
USERNAME = "brlnt"
PASSWORD = "123456"
IP_RANGE = "172.17.100."
SSH_COMMAND = "sudo shutdown -h now"

# Loop through IP addresses and execute the shutdown command
for i in range(251, 254):
    ip_address = IP_RANGE + str(i)
    ssh_client = paramiko.SSHClient()
    ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh_client.connect(ip_address, username=USERNAME, password=PASSWORD)
    ssh_client.exec_command(SSH_COMMAND)
    ssh_client.close()

print("All systems have been shutdown.")

# Save the log file in the same directory as the shutdown-$date.log
log_file = open(f"shutdown-{date}.log", "w")
