if [ -f ~/.Xresources ]; then
	xrdb -merge ~/.Xresources
fi

# set compose key
setxkbmap -option "compose:caps"

# set the background
if [ -f /usr/bin/feh ]; then
    feh --bg-scale ~/.wallpaper.jpg &
fi

exec i3
