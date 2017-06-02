. ~/.profile

setxkbmap -layout us -variant altgr-intl -option 'ctrl:nocaps,compose:ralt,altwin:swap_alt_win' &

feh --bg-fill ~/.wall.jpg &

xautolock -time 18 -locker "lock" &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

#qjackctl &

#exec i3
