#!/bin/bash

# Select the color of the text in the terminal
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Check if google-chrome is installed or not and install it if not installed
if ! [ -x "$(command -v google-chrome)" ]; then
  printf "${RED}Error: Google Chrome is not installed.${NC}"
  printf "${GREEN}Installing google-chrome...${NC}"
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
  sudo apt-get update
  sudo apt-get install google-chrome-stable
else
  printf "${GREEN}google-chrome is already installed.${NC}"
fi

# Copy the google-chrome shortcut to the desktop
cp /usr/share/applications/google-chrome.desktop ~/Desktop
# Enable allow-lauching the app from the desktop
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' ~/Desktop/google-chrome.desktop
# Enable allow-lauching the app from the terminal (optional)
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /usr/share/applications/google-chrome.desktop
# # Edit the 108the line (change Exec=/usr/bin/google-chrome-stable %U to Exec=/usr/bin/google-chrome-stable --incognito)
# sudo sed -i '108s/.*/Exec=\/usr\/bin\/google-chrome-stable --incognito %U/g' ~/Desktop/google-chrome.desktop
# sudo sed -i '108s/.*/Exec=\/usr\/bin\/google-chrome-stable --incognito %U/g' /usr/share/applications/google-chrome.desktop

printf "${GREEN}Setting up Chrome Done!${NC}"
sleep 2

# Author: KARTHIK LAL
printf "${YELLOW}Script by : KARTHIK LAL ${NC}" && sleep 1
printf "${YELLOW}Website   : https://karthiklal.in${NC}" && sleep 1
printf "${YELLOW}Github    : https://github.com/karthik558${NC}" && sleep 1

# Save the log file to run-script.log file
#./setup-chrome.sh > run-script.log

# End of the script
exit
