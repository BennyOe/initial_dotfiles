xrandr -s 2736x1824
xrandr --output eDP1 --scale 0.7
autorandr --change
dwmblocks & 
nitrogen --restore &
picom &
redshift-gtk -l 53.55:09.99 &
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

# mount 
sudo mount /dev/sda1 ~/Daten

# mouse acceleration
xinput --set-prop 10 'libinput Accel Speed' 0.8
xinput --set-prop 9 'libinput Accel Speed' 0.8

# thunar daemon for mounting drives
thunar --daemon &

# spotify
#if ! pgrep -x "spotifyd" > /dev/null                                                                                                                                                          INT ✘  
#then
#    spotifyd --no-daemon &
#fi
