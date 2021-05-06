xrandr -s 1920x1080
#xrandr --output eDP1 --scale 0.7
autorandr --change
dwmblocks & 
nitrogen --restore &
picom &
redshift &
xidlehook --not-when-fullscreen --not-when-audio --timer 600 'multilockscreen -l dimblur' '' &

# systray applets
nm-applet & 
pa-applet &
blueman-applet &

# set the delay time for the keyboard
xset r rate 200 30 &

# set numblock on
numlockx on &

# map lctrl to escape
xcape -e 'Control_L=Escape' &

#start polkit agent
/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# mouse acceleration
#xinput --set-prop <device id> 'libinput Accel Speed' <acceleration factor>

# thunar daemon for mounting drives
thunar --daemon &

# spotify
if ! pgrep -x "spotifyd" > /dev/null                                                                                                                                                          INT ✘  
then
    spotifyd --no-daemon &
fi
