#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="$HOME/.config/rofi/applets/android"
rofi_command="rofi -theme $dir/eight.rasi"

# Error msg
msg() {
	rofi -theme "$dir/message.rasi" -e "$1"
}

# Browser
if [[ -f /usr/bin/firefox ]]; then
	app="firefox"
elif [[ -f /usr/bin/chromium ]]; then
	app="chromium"
elif [[ -f /usr/bin/midori ]]; then
	app="midori"
else
	msg "No suitable web browser found!"
	exit 1
fi

# Links
brave="🔍"
pronote="ⓟ"
twitter=""
github=""
music="🎶"
mail=""
youtube=""
insta="📷"

# Variable passed to rofi
options="$brave\n$pronote\n$twitter\n$github\n$music\n$mail\n$youtube\n$insta"

chosen="$(echo -e "$options" | $rofi_command -p "Open In  :  Firefox" -dmenu -selected-row 0)"
case $chosen in
    $brave)
        $app https://search.brave.com &
        ;;
    $pronote)
        $app https://0782563m.index-education.net/pronote/eleve.html?login=true &
        ;;
    $twitter)
        $app https://www.twitter.com &
        ;;
    $music)
        $app https://www.deezer.com/us/ &
        ;;
    $github)
        $app https://www.github.com &
        ;;
    $mail)
        $app https://mail.google.com/mail/u/1 &
        ;;
    $youtube)
        $app https://www.youtube.com &
        ;;
    $insta)
        $app https://www.instagram.com &
        ;;

esac

