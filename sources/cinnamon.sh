downloadAssets
installAssets
printf "$arrow installing Plank..."
installPackage plank

printf "$arrow applying changes...\n"
printf "$arrow updating theme..."
gsettings set org.cinnamon.theme name "WhiteSur-dark"
gsettings set org.cinnamon.desktop.interface gtk-theme "WhiteSur-dark"
gsettings set org.cinnamon.desktop.wm.preferences theme  "WhiteSur-dark"
printf "$arrow updating icons...\r"
gsettings set org.cinnamon.desktop.interface icon-theme "WhiteSur-dark"
printf "$arrow updating other settings...\r"
gsettings set org.cinnamon.desktop.wm.preferences button-layout 'close,minimize,maximize:'
gsettings set org.cinnamon.desktop.background picture-uri "file://$HOME/WhiteSur.png"
gsettings set org.cinnamon panels-enabled "['1:0:top']"
gsettings set net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock1/ theme "Gtk+"
gsettings set org.cinnamon enabled-applets "['panel1:left:0:menu@cinnamon.org:32', 'panel1:right:11:show-desktop@cinnamon.org:33', 'panel1:right:0:systray@cinnamon.org:35', 'panel1:right:1:xapp-status@cinnamon.org:36', 'panel1:right:2:notifications@cinnamon.org:37', 'panel1:right:3:printers@cinnamon.org:38', 'panel1:right:4:removable-drives@cinnamon.org:39', 'panel1:right:5:keyboard@cinnamon.org:40', 'panel1:right:6:favorites@cinnamon.org:41', 'panel1:right:7:network@cinnamon.org:42', 'panel1:right:8:sound@cinnamon.org:43', 'panel1:right:9:power@cinnamon.org:44', 'panel1:right:10:calendar@cinnamon.org:45']"
echo 'if command -v plank &> /dev/null && ! pidof plank >/dev/null
then
    plank &> /dev/null
fi' >> $HOME/.profile
printf "\n\n$arrow Done!\n\n"