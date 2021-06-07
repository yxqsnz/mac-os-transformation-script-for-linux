#! /bin/bash
declare -A osInfo;
osInfo[/etc/debian_version]="apt-get install -y"
osInfo[/etc/alpine-release]="apk --update add"
osInfo[/etc/centos-release]="yum install -y"
osInfo[/etc/fedora-release]="dnf install -y"
osInfo[/etc/arch-release]="pacman -S"
arrow="\u001b[32m===>\u001b[37m"
cursor_url="https://github.com/ful1e5/apple_cursor/releases/download/v1.1.4/macOSBigSur.tar.gz"
function downloadAssets { 
	printf "$arrow Downloading Theme...\n"
	git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git downloads/theme -q > logs.log
	printf "$arrow Downloading Icon theme...\n"
	git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git downloads/icon -q >> logs.log
	# printf "$arrow Downloading cursor...\n"
	# curl $cursor_url -s 2> logs.log > downloads/cursor.zip
	printf "$arrow Downloading wallpaper...\n"
	curl "https://raw.githubusercontent.com/vinceliuice/WhiteSur-kde/master/wallpaper/WhiteSur.png" -s > $HOME/WhiteSur.png 
}
function installAssets {
	printf "$arrow Installing theme...\n" 
	./downloads/theme/install.sh -c dark > logs.log
	printf "$arrow Installing icons...\n"
	./downloads/icon/install.sh > logs.log
	# printf "$arrow Installing cursor...\n"
	# unzip -oqq downloads/cursor.zip -d $HOME/.icons/	
}
function installPackage {
	 for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        package_manager=${osInfo[$f]}
    fi
done
  sudo ${package_manager} ${1}
}
