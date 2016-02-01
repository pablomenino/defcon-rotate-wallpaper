#!/bin/bash

#----------------------------------------------------------------------------------------
# defcon-rotate-wallpaper
# Version: 0.5
# 
# WebSite:
# http://pablomenino.github.io/defcon-rotate-wallpaper/
# https://github.com/pablomenino/defcon-rotate-wallpaper
# 
# Copyright © 2016 - Pablo Meniño <pablo.menino@gmail.com>
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# Config Parser

config_parser() {
 FILE=$1
 SECTION=$2
 eval $(sed -e 's/[[:space:]]*\=[[:space:]]*/=/g' \
 -e 's/[;#].*$//' \
 -e 's/[[:space:]]*$//' \
 -e 's/^[[:space:]]*//' \
 -e "s/^\(.*\)=\([^\"']*\)$/\1=\"\2\"/" \
 < $FILE \
 | sed -n -e "/^\[$SECTION\]/I,/^\s*\[/{/^[^;].*\=.*/p;}")
}

#----------------------------------------------------------------------------------------
# Get the script directory
script_dir=$( cd ${0%/*} && pwd -P )

#----------------------------------------------------------------------------------------
# Get theme from configuration file
# The value is stored on variable "$default_theme"

SECTION="theme"
config_parser "$script_dir/defcon-rotate-wallpaper.config" $SECTION

#----------------------------------------------------------------------------------------
# Calculate file to ratate wallpaper based on the selected theme

# get the our in 24 format
hourfile="$(date -d "today" +"%H")"

# get wallpaper filename
rotatefile="file://"
rotatefile+=$script_dir
rotatefile+="/themes/"
rotatefile+=$default_theme
rotatefile+="/"
rotatefile+=$default_theme
rotatefile+="_"
rotatefile+=$hourfile
rotatefile+=".png"

#----------------------------------------------------------------------------------------
# Get current wallpaper
current_wall=$(gsettings get org.gnome.desktop.background picture-uri)

#----------------------------------------------------------------------------------------
# Get params
OPERATION=$1

#----------------------------------------------------------------------------------------
# Get Gnome Session (Change Wallpaper from Crontab)

PID=$(pgrep -u $USER gnome-session)
# PID=$(pgrep gnome-session)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)

#----------------------------------------------------------------------------------------
# If no parameter selected, show some information.

if [ "$OPERATION" == "" ]; then
	echo "This script is executed from the crontab."
	echo "	See README.md file for install."
fi

#----------------------------------------------------------------------------------------
# Rotate wallpaper based on current hour

if [ "$OPERATION" == "--rotate" ]; then
    # Rotate Wallpaper
	# If diferent wallpaper file, change it
	if [[ $current_wall != *"$rotatefile"* ]]
	then
		gsettings set org.gnome.desktop.background picture-uri "$rotatefile"
	fi
fi

#----------------------------------------------------------------------------------------
# Exit

exit 0
#----------------------------------------------------------------------------------------
