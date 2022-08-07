dir="$HOME/.config/rofi/applets/"
rofi_command="rofi -theme $dir/apps.rasi"

# Links
apps="🎮"
files="📁"
editor="📘"
internet="🖧"
sound="🎶"
launcher="▶"
power="⏻"

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Variable passed to rofi
options="$apps\n$files\n$editor\n$sound\n$internet\n$launcher\n$power"

chosen="$(echo -e "$options" | $rofi_command -p "MENU" -dmenu -selected-row 0)"
case $chosen in
    $apps)
      /home/arnaud/.config/rofi/applets/android/apps.sh
	;;
    $files)
#		if [[ -f /usr/bin/thunar ]]; then
    thunar
     # xfce4-terminal -e "lf /home/arnaud/Desktop" &
        ;;
    $editor)
		if [[ -f /usr/bin/nvim ]]; then
			xfce4-terminal -e "nvim ~/Desktop" &
		fi
        ;;
    $sound)
	    xfce4-terminal -e pulsemixer && bspc node -t floating && bspc node -z top 0 200 bottom 0 -200
        ;;
    $internet)
      /home/arnaud/.config/rofi/applets/android/quicklinks.sh
        ;;
    $launcher)
	    rofi -combi-modi window, drun -theme ~/.config/rofi/launchers/colorful/style_1 -show drun
        ;;
    $power)
      /home/arnaud/.config/rofi/applets/android/powermenu.sh
        ;;
esac
