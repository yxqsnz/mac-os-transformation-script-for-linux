source './sources/util.sh'
printf "Select your WM.\n1) GNOME\n2) Cinnamon\n"
read -n1 -p "> " selected
printf '\n'
case $selected in 
 1) 
 	source 'sources/gnome.sh'
 ;;
 2)
  source 'sources/cinnamon.sh'
 ;;
 9)
   source 'sources/xfce.sh'
 ;;
esac
