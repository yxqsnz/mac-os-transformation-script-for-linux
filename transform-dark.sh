#! /bin/bash
arrow="\u001b[32m===>\u001b[37m"
echo "YOU NEED DASH TO DOCK, USER THEMES AND DING EXTENSIONS INSTALLED!"
echo "THIS SCRIPT WILL REPLACE YOUR CURRENT THEME CONFIGURATION!"
echo "Starting in 5 seconds..."
sleep 5
rm -rf downloads;
mkdir downloads
printf "$arrow Downloading Theme...\n"
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git downloads/theme -q > logs.log
printf "$arrow Downloading Icon theme...\n"
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git downloads/icon -q >> logs.log

printf "$arrow Downloading cursor...\n"
curl "https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE0NjkwNTU4MDMiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjI3MTYxMjU1ZmRhYzJlM2NkYjNiM2JhYTY2NDkyNzAwNWU5MzE3MzI2OWU3NTVlYTNjYjlkMTAzODJjYTEzZTI4NzgwYjYyZWYyODk3ZThlZWNjNmE4MTQwYzkwNDA2MGQwMTMxYWUyYTZmMzk0ZDU5MTU2MWUzYjNkNGI1ZjZkIiwidCI6MTYyMjY0NDA5Nywic3RmcCI6IjRlOGI1YjI4OWIxZDM2ZDg5ZjM3ZDY0OTdlODYzMjE2Iiwic3RpcCI6IjQ1LjIzMi41OS4xODcifQ.tAlCMPVXPW1M3RzDG5ccl8zmw49b9OEcf6y0IOpXFww/macOS%20Cursor%20Set.ziphttps://www.gnome-look.org/p/1148748/startdownload\?file_id\=1469055803\&file_name\=macOS%20Cursor%20Set.zip\&file_type\=application/zip\&file_size\=668888" -s 2> logs.log > downloads/cursor.zip

printf "$arrow Downloading wallpaper...\n"
curl "https://raw.githubusercontent.com/vinceliuice/WhiteSur-kde/master/wallpaper/WhiteSur.png" -s > $HOME/WhiteSur.png 

printf "$arrow Installing theme...\n" 
./downloads/theme/install.sh -c dark > logs.log
printf "$arrow Installing icons...\n"
./downloads/icon/install.sh > logs.log
printf "$arrow Installing cursor...\n"
unzip -oqq downloads/cursor.zip -d $HOME/.icons/

printf "$arrow applying changes...\n"
gsettings set org.gnome.desktop.interface gtk-theme  "WhiteSur-dark"
gsettings set org.gnome.desktop.interface icon-theme "WhiteSur"
gsettings set org.gnome.desktop.wm.preferences theme "WhiteSur-dark"
gsettings set org.gnome.shell.extensions.user-theme name "WhiteSur-dark"
gsettings set org.gnome.desktop.interface cursor-theme "MacOs Cursor Set"
gsettings set org.gnome.desktop.background picture-uri "file://$HOME/WhiteSur.png"
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'

./downloads/theme/tweaks.sh -d -c dark >> logs.log
printf "$arrow Installed... Enjoy!\n"
