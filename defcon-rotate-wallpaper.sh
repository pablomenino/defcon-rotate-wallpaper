#!/bin/bash
# defcon-rotate-wallpaper

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
config_parser "$scriptdir/defcon-rotate-wallpaper.config" $SECTION

#----------------------------------------------------------------------------------------
# Calculate file to ratate wallpaper based on the selected theme

# get the our in 24 format
hourfile="$(date -d "today" +"%H")"

# get wallpaper filename
rotatefile="file://$scriptdir/themes/$default_theme/$default_theme_$hourfile.png"

#----------------------------------------------------------------------------------------
# Get params

OPERATION=$1

#----------------------------------------------------------------------------------------
# If no parameter selected, show some information.

if [ "$OPERATION" == "" ]; then
	echo "This script is executed from the crontab."
	echo "	See README.md file for install."
fi

#----------------------------------------------------------------------------------------
# Rotate wallpaper based on current hour

if [ "$OPERATION" == "--rotate" ]; then
	gsettings set org.gnome.desktop.background picture-uri "$rotatefile"
fi

#----------------------------------------------------------------------------------------
# Exit

exit 0
#----------------------------------------------------------------------------------------
