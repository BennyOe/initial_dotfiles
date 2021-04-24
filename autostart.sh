xrandr -s 1920x1080
autorandr --change
dwmblocks & 
nitrogen --restore &
picom &
redshift &
xidlehook --not-when-fullscreen --not-when-audio --timer 600 'multilockscreen -l dimblur' '' &
# systray applets
nm-applet & 
pa-applet &

# set the delay time for the keyboard
xset r rate 200 30 &

# set numblock on
numlockx on &

# map lctrl to escape
xcape -e 'Control_L=Escape' &

#start polkit agent
polkit-dumb-agent &
