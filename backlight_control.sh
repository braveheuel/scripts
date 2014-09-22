#!/bin/bash
#
yet=`cat /sys/class/backlight/acpi_video0/actual_brightness`
max=`cat /sys/class/backlight/acpi_video0/max_brightness`

bl_up() {
    if [ $yet -lt $max ]; then
        let new=$yet+1
        sudo su -c "echo $new > /sys/class/backlight/acpi_video0/brightness"
    else
        echo "Helligkeit ist schon maximal"
    fi
}

bl_down() {
    if [ $yet -gt 0 ]; then
        let new=$yet-1
        sudo su -c "echo $new > /sys/class/backlight/acpi_video0/brightness"
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
