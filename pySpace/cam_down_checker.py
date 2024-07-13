import os
import time

# Define variables
developer = "KARTHIK LAL"
email = "dev@karthiklal.in"
website = "https://karthiklal.in"
version = "2.0.0"
date = "2023-01-26"
project = "IP Camera Status Checker"
purpose = "To check the status of IP cameras in the network"

# Define title for the console
os.system("title CamDownChecker - %s" %developer)

# Automation Script Information [ASCII Art]
def display_banner():    
    banner =  "██████╗ █████╗ ███╗   ███╗      ██████╗  ██████╗ ██╗    ██╗███╗   ██╗       ██████╗██╗  ██╗███████╗ ██████╗██╗  ██╗███████╗██████╗ \n"
    banner += "██╔════╝██╔══██╗████╗ ████║      ██╔══██╗██╔═══██╗██║    ██║████╗  ██║      ██╔════╝██║  ██║██╔════╝██╔════╝██║ ██╔╝██╔════╝██╔══██╗\n"
    banner += "██║     ███████║██╔████╔██║█████╗██║  ██║██║   ██║██║ █╗ ██║██╔██╗ ██║█████╗██║     ███████║█████╗  ██║     █████╔╝ █████╗  ██████╔╝\n"
    banner += "██║     ██╔══██║██║╚██╔╝██║╚════╝██║  ██║██║   ██║██║███╗██║██║╚██╗██║╚════╝██║     ██╔══██║██╔══╝  ██║     ██╔═██╗ ██╔══╝  ██╔══██╗\n"
    banner += "╚██████╗██║  ██║██║ ╚═╝ ██║      ██████╔╝╚██████╔╝╚███╔███╔╝██║ ╚████║      ╚██████╗██║  ██║███████╗╚██████╗██║  ██╗███████╗██║  ██║\n"
    banner += "╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝      ╚═════╝  ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═══╝       ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝\n"
    print(banner)

# Terminal header settings and information
os.system('color 1F')
print("Developer    :   %s" %developer)
print('Version      :   %s' %version)
print("Created Date :   %s" %date)
print('Project      :   %s' %project)
print('Purpose      :   %s' %purpose)
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
for i in range(1, 255):
    response = os.system(f'ping -n 3 10.10.2.{i} | find "TTL="')
    if response != 0:
        with open(file_name, 'a') as f:
            f.write(
                f"The IP address 10.10.2.{i} is currently unreachable.\n")
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

# Exit from the script
os.system("cls")
print(f'=======================================')
print(f'THANK YOU FOR USING CAMERA DOWN CHECKER')
print(f'=======================================')
print()
print(f'DEVELOPER: %s ' %developer)
print(f'EMAIL: %s ' %email)
print(f'WEBSITE: %s ' %website)
print(f'VERSION: %s ' %version)
print(f'CREATED DATE: %s ' %date)
print()
print(f'Copying and distribution of this file, with or without modification, are permitted in any medium without royalty provided the copyright notice and this notice are preserved.')
print(f'Tools are provided as is without warranty of any kind and the author is not responsible for any damage caused by the use of these tools.')
print(f'Copyright © %s %s' %(date, developer))
print()
input("Press Enter to exit...")