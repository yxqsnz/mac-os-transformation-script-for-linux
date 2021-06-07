#!/bin/bash
downloadAssets
installAssets

printf "$arrow applying changes...\n"

#xfconf-query -c xfwm4 -p /general/theme -s WhiteSur-dark
xfconf-query -c xsettings -p /Net/ThemeName -s "WhiteSur-dark-solid"
xfconf-query -c xsettings -p /Net/IconThemeName -s "WhiteSur"