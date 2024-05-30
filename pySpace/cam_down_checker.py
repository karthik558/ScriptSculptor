import os
import time

# Automation Script Information [ASCII Art]

def display_banner():
    banner =  "██╗  ██╗ █████╗ ██████╗ ████████╗██╗  ██╗██╗██╗  ██╗     ██╗      █████╗ ██╗\n"
    banner += "██║ ██╔╝██╔══██╗██╔══██╗╚══██╔══╝██║  ██║██║██║ ██╔╝     ██║     ██╔══██╗██║\n"
    banner += "█████╔╝ ███████║██████╔╝   ██║   ███████║██║█████╔╝█████╗██║     ███████║██║\n"
    banner += "██╔═██╗ ██╔══██║██╔══██╗   ██║   ██╔══██║██║██╔═██╗╚════╝██║     ██╔══██║██║\n"
    banner += "██║  ██╗██║  ██║██║  ██║   ██║   ██║  ██║██║██║  ██╗     ███████╗██║  ██║███████╗\n"
    banner += "╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝     ╚══════╝╚═╝  ╚═╝╚══════╝\n"
    print(banner)


display_banner()

# Terminal header settings and information
os.system('color 0A')
print("Developer  :   KARTHIK LAL (https://karthiklal.in)")
print('Version     :   1.2 STABLE')
print("Created Date:   2023-01-26")
print('Project     :   IP Camera Status Checker')
print('Purpose     :   To check the status of IP cameras in the network')
print("")

# If press any key to continue
input("Press Enter to continue...")
print("")

# Variable Declaration and Initialization
mydate = time.strftime('%Y-%m-%d')
mytime = time.strftime('%H-%M')
file_name = f'cam_status_{mydate}_{mytime}.txt'

# File Creation
with open(file_name, 'w') as f:
    f.write('* These camera IPs do not appear to be responsive at the moment. * \n')
    print('', file=f)

# Ping Test
for i in range(15, 61):
    response = os.system(f'ping -n 5 192.168.4.{i} | find "TTL="')
    if response != 0:
        with open(file_name, 'a') as f:
            f.write(
                f"The IP address 192.168.4.{i} is currently unreachable.\n")
        time.sleep(2)

# End of Script
print('Camera Status Check Completed.')
time.sleep(2)
with open(file_name, 'a') as f:
    f.write(
        f'This log entry is from the following date: {mydate} | Time: {mytime}\n')
    print('', file=f)

print(f'Check the file {file_name} for the results.')
time.sleep(2)
print()

# Exit from script
os.system("cls")
message = "Thank you for using the KARTHIK-LAL (cam-host-checker) script.\nHave a great day ahead!\n"
print(message)
input("Press Enter to exit...")
