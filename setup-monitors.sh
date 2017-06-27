#! /bin/sh
#
# setup-monitors.sh
# Copyright (C) 2016 cheuel <cheuel@box00003>
#
# Distributed under terms of the MIT license.
#



#xrandr -d :0.0 --output DP2-1 --left-of eDP1 --auto
xrandr -d :0.0 --output DP2-2 --left-of eDP1 --auto
#xrandr -d :0.0 --output DP2-2 --left-of DP2-1 --auto
#xrandr -d :0.0 --output DP2-3 --left-of DP2-2 --auto

# reload i3
i3-msg reload
# Maybe this is not needed after a reload
feh --bg-scale "$HOME/Bilder/Background/actual"

xmodmap "$HOME/.xmodmaprc"
