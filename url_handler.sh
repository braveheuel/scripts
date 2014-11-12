#!/bin/sh
#
#
BROWSER="google-chrome"

which $DROWSER

if [ $? -eq 0 ];
then
	$BROWSER "$1" 2>&1 1>/dev/null & 
else
	xdg-open "$1" 2>&1 1>/dev/null &
fi
