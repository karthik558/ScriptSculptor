#!/bin/bash

# Install xorg-xinput if not already installed
if ! pacman -Qs xorg-xinput > /dev/null; then
  echo "Installing xorg-xinput..."
  sudo pacman -S --noconfirm xorg-xinput
else
  echo "xorg-xinput is already installed."
fi

# Identify the touchpad device
TOUCHPAD_ID=$(xinput list | grep -i touchpad | awk -F'id=' '{print $2}' | awk '{print $1}')
if [ -z "$TOUCHPAD_ID" ]; then
  echo "No touchpad found. Exiting..."
  exit 1
fi
echo "Touchpad found with ID: $TOUCHPAD_ID"

# Enable tap-to-click
echo "Enabling tap-to-click for touchpad ID $TOUCHPAD_ID..."
xinput set-prop "$TOUCHPAD_ID" "libinput Tapping Enabled" 1

# Create the xorg.conf.d directory if it doesn't exist
XORG_CONF_DIR="/etc/X11/xorg.conf.d"
if [ ! -d "$XORG_CONF_DIR" ]; then
  echo "Creating xorg.conf.d directory..."
  sudo mkdir -p "$XORG_CONF_DIR"
fi

# Create or update the 40-libinput.conf file
LIBINPUT_CONF="$XORG_CONF_DIR/40-libinput.conf"
echo "Creating/updating $LIBINPUT_CONF..."
sudo bash -c "cat > $LIBINPUT_CONF" <<EOL
Section "InputClass"
    Identifier "touchpad"
    MatchIsTouchpad "on"
    Driver "libinput"
    Option "Tapping" "on"
EndSection
EOL

# Prompt to restart the system or X session
echo "Configuration complete. Please restart your computer or X session to apply the changes."

