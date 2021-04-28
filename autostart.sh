xrandr -s 2736x1824
xrandr --output eDP1 --scale 0.65
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

# mount 
sudo mount /dev/sda1 ~/Daten

# mouse acceleration
xinput --set-prop 10 'libinput Accel Speed' 0.8
