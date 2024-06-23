#!/bin/bash
clear
printf "Setting symlinks\n"
sleep 2

cd ~/.dotfiles

rm ~/.zshrc
ln -sv ~/.dotfiles/.zshrc ~ 

rm ~/.vimrc
ln -sv ~/.dotfiles/.vimrc ~

rm ~/.dwm/autostart.sh
chmod +x ~/.dotfiles/autostart.sh
ln -sv ~/.dotfiles/autostart.sh ~/.dwm/

mkdir ~/.config/dunst
rm ~/.config/dunst/dunstrc
ln -sv ~/.dotfiles/dunstrc ~/.config/dunst/ 

sudo mkdir /usr/share/xsessions 
sudo cp ~/.dotfiles/dwm.desktop /usr/share/xsessions/dwm.desktop

mkdir ~/.config/picom/
rm ~/.config/picom/picom.conf
ln -sv ~/.dotfiles/picom.conf ~/.config/picom/ 

rm -rf ~/.config/ranger
mkdir ~/.config/ranger
ln -sv ~/.dotfiles/ranger/rc.conf ~/.config/ranger/ 
ln -sv ~/.dotfiles/ranger/rifle.conf ~/.config/ranger/
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
ln -s ~/.dotfiles/ranger/scope.sh ~/.config/ranger/
chmod +x ~/.config/ranger/scope.sh

rm -rf ~/.config/yazi
mkdir ~/.config/yazi
mkdir ~/.config/yazi/plugins
mkdir ~/.config/yazi/flavors
ln -sv ~/.dotfiles/yazi/init.lua ~/.config/yazi/ 
ln -sv ~/.dotfiles/yazi/keymap.toml ~/.config/yazi/ 
ln -sv ~/.dotfiles/yazi/theme.toml ~/.config/yazi/ 
ln -sv ~/.dotfiles/yazi/yazi.toml ~/.config/yazi/ 
ln -sv ~/.dotfiles/yazi/plugins/smart-enter.yazi ~/.config/yazi/plugins
ln -sv ~/.dotfiles/yazi/flavors/tokyo-night.yazi ~/.config/yazi/flavors
ln -sv ~/.dotfiles/yazi/flavors/onedark.yazi ~/.config/yazi/flavors

rm -rf ~/.config/rofi
mkdir ~/.config/rofi
mkdir ~/.config/rofi/themes
ln -sv ~/.dotfiles/rofi/config.rasi ~/.config/rofi/ 
ln -sv ~/.dotfiles/rofi/themes/onedark.rasi ~/.config/rofi/themes/ 

rm -rf ~/.config/paru
mkdir ~/.config/paru
ln -sv ~/.dotfiles/paru/paru.conf ~/.config/paru/ 

mkdir ~/.local/bin
ln -sv ~/.dotfiles/scripts/pdfshrink ~/.local/bin/ 
chmod +x ~/.dotfiles/scripts/pdfshrink
ln -sv ~/.dotfiles/scripts/launchspt ~/.local/bin/ 
chmod +x ~/.dotfiles/scripts/launchspt
ln -sv ~/.dotfiles/scripts/rofi-power-menu ~/.local/bin/ 
chmod +x ~/.dotfiles/scripts/rofi-power-menu
ln -sv ~/.dotfiles/scripts/dekeys ~/.local/bin/
chmod +x ~/.dotfiles/scripts/dekeys
ln -sv ~/.dotfiles/scripts/enkeys ~/.local/bin/
chmod +x ~/.dotfiles/scripts/enkeys
ln -sv ~/.dotfiles/scripts/spotifyChangeSong.sh ~/.local/bin/
chmod +x ~/.dotfiles/scripts/spotifyChangeSong.sh
ln -sv ~/.dotfiles/scripts/volume.sh ~/.local/bin/ 
chmod +x ~/.dotfiles/scripts/volume.sh
ln -sv ~/.dotfiles/scripts/brightness.sh ~/.local/bin/ 
chmod +x ~/.dotfiles/scripts/brightness.sh
ln -sv ~/.dotfiles/scripts/dwmnet ~/.local/bin/ 
chmod +x ~/.dotfiles/scripts/dwmnet
ln -sv ~/.dotfiles/scripts/audio2HDMI ~/.local/bin/ 
chmod +x ~/.dotfiles/scripts/audio2HDMI
ln -sv ~/.dotfiles/scripts/audio2USB ~/.local/bin/ 
chmod +x ~/.dotfiles/scripts/audio2USB

ln -sv ~/.dotfiles/scripts/lightsOn ~/.local/bin/ 
chmod +x ~/.dotfiles/scripts/lightsOn
ln -sv ~/.dotfiles/scripts/lightsOff ~/.local/bin/ 
chmod +x ~/.dotfiles/scripts/lightsOff

rm -rf ~/.config/flameshot
mkdir ~/.config/flameshot
ln -sv ~/.dotfiles/flamrshot.ini ~/.config/flameshot/ 

rm -rf ~/.config/spotifyd
mkdir ~/.config/spotifyd
ln -sv ~/.dotfiles/spotifyd.conf ~/.config/spotifyd
#rm -rf ~/.config/autorandr/
#ln -sv ~/.dotfiles/autorandr ~/.config/autorandr
#chmod +x ~/.config/autorandr/mobile/postswitch ~/.config/autorandr/docked/postswitch

rm -f .Xmodmap
ln -sv ~/.dotfiles/.Xmodmap ~/

rm -f ~/.ideavimrc
ln -sv ~/.dotfiles/.ideavimrc ~/

rm -rf ~/.config/multilock
ln -sv ~/.dotfiles/multilock ~/.config/multilock

rm -f ~/.config/mimeapps.list
ln ~/.dotfiles/mimeapps.list ~/.config/mimeapps.list

rm -rf ~/.config/gtk-3.0/
mkdir ~/.config/gtk-3.0
ln ~/.dotfiles/settings.ini ~/.config/gtk-3.0
chmod +x ~/.config/gtk-3.0/settings.ini

ln ~/.dotfiles/scripts/communications.sh ~/.local/bin/
chmod +x ~/.local/bin/communications.sh

ln ~/.dotfiles/scripts/slack.sh ~/.local/bin/
chmod +x ~/.local/bin/slack.sh

sudo mkdir /usr/share/wallpapers
sudo cp ~/.dotfiles/default_wallpaper.png /usr/share/wallpapers/default_wallpaper.png
sudo rm -f /etc/lightdm/lightdm-gtk-greeter.conf
sudo cp ~/.dotfiles/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf

sudo cp ~/.dotfiles/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
printf " dotfiles successfully installed\n"
sleep 2
