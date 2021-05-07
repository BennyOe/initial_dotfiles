#!/bin/bash

    muted=`pamixer --get-mute`
    volume=`pamixer --get-volume`
    bar=$(seq -s "─" $(($volume / 6)) | sed 's/[0-9]//g')
    space="             $bar"
    if [ $muted == true ]; then
        dunstify -u low -r 101 " Muted"
    else
        if [ $volume -le 50 ]; then
            dunstify -u low -r 101 " $bar $volume"
        else
            dunstify -u low -r 101 " $bar $volume"
        fi
    fi

