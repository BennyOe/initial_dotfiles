#xrandr -s 1920x1080
#xrandr --output eDP1 --scale 0.7
autorandr --change
dwmblocks &
picom &
xidlehook --not-when-fullscreen --not-when-audio --timer 600 'betterlockscreen -l dimblur' '' &

# systray applets
nm-applet &
pa-applet &
blueman-applet &

# set the delay time for the keyboard
xset r rate 200 30

# set numblock on
numlockx on

# map lctrl to escape
xcape -e 'Control_L=Escape'
xcape -e 'Mode_switch=Escape'

#start polkit agent
/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# libinput gestures
libinput-gestures-setup start

# thunar daemon for mounting drives
thunar --daemon &

#redshift -c ~/.config/redshift/redshift.conf &
# mouse acceleration
#xinput --set-prop <device id> 'libinput Accel Speed' <acceleration factor>
