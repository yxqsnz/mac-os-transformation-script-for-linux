#!/bin/bash
echo "YOU NEED DASH TO DOCK, USER THEMES AND DING EXTENSIONS INSTALLED!"
echo "THIS SCRIPT WILL REPLACE YOUR CURRENT THEME CONFIGURATION!"
echo "Starting in 5 seconds..."
sleep 5

downloadAssets
installAssets

printf "$arrow applying changes...\n"
gsettings set org.gnome.desktop.interface gtk-theme  "WhiteSur-dark"
gsettings set org.gnome.desktop.interface icon-theme "WhiteSur"

gsettings set org.gnome.desktop.wm.preferences theme "WhiteSur-dark"
gsettings set org.gnome.shell.extensions.user-theme name "WhiteSur-dark"
# gsettings set org.gnome.desktop.interface cursor-theme "MacOs Cursor Set"
gsettings set org.gnome.desktop.background picture-uri "file://$HOME/WhiteSur.png"
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'

./downloads/theme/tweaks.sh -d -c dark >> logs.log
printf "$arrow Installed... Enjoy!\n"
