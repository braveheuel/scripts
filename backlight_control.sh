#!/bin/bash
#
SOURCEPATH="/sys/class/backlight/intel_backlight/"
yet=`cat $SOURCEPATH/actual_brightness`
max=`cat $SOURCEPATH/max_brightness`
BRIGHTNESS="$SOURCEPATH/brightness"

bl_up() {
    if [ $yet -lt $max ]; then
        let new=$yet+10
        sudo su -c "echo $new > $BRIGHTNESS"
    else
        echo "Helligkeit ist schon maximal"
    fi
}

bl_down() {
    if [ $yet -gt 0 ]; then
        let new=$yet-10
        sudo su -c "echo $new > $BRIGHTNESS"
    else
        echo "Noch dunkler geht nicht"
    fi
}

case "$1" in
    'h')
        bl_up
        ;;
    'd')
        bl_down
        ;;
    'z')
        echo "aktuelle Helligkeit $yet von $max"
        ;;
    *)
        echo "$0 h (heller) | d (dunkler) | z (aktueller Wert)"
esac
