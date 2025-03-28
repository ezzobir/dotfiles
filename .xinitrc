#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# begin autostart programms
# -------------------------------

# add arabic language
# setxkbmap -model pc104alt -layout us,ara -variant ,digits -option grp:win_space_toggle caps:escape
setxkbmap -layout us,ara -variant ,digits -option grp:win_space_toggle

# set the X11 typematic delay and repeat
xset r rate 200 30 &

# set random backgroun
DISPLAY=:0 feh --no-fehbg --bg-fill --randomize /home/ezzobir/dotfiles/Wallpapers &

# default brightness
brightnessctl set 5% &

dunst &

flameshot &

# gromit-mpx &

# sxhkd &

exec i3
# -------------------------------
# end autostart programms
