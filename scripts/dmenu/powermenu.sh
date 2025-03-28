#!/bin/bash

function powermenu {
	options="Cancel\nShutdown\nRestart\nSleep\nLogout\nLock"

	selected=$(echo -e $options | dmenu -i)

	if [[ $selected = "Shutdown" ]]; then
		systemctl poweroff
	elif [[ $selected = "Restart" ]]; then
		systemctl reboot
	elif [[ $selected = "Sleep" ]]; then
		mpc -q pause
		amixer set Master mute
		systemctl suspend
	elif [[ $selected = "Logout" ]]; then
		# Check if the current window manager is i3
		if pgrep -x "i3" > /dev/null; then
		    i3-msg exit
		# Check if the current window manager is Sway
		elif pgrep -x "sway" > /dev/null; then
			swaymsg exit
		fi
	elif [[ $selected = "Lock" ]]; then
		# Check if the current window manager is i3
		if pgrep -x "i3" > /dev/null; then
		    i3lock
		# Check if the current window manager is Sway
		elif pgrep -x "sway" > /dev/null; then
		    swaylock
		fi
	elif [[ $selected = "Cancel" ]]; then
		return
	fi
}

powermenu

