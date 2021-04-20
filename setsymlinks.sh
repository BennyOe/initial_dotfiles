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

sudo ln -sv ~/.dotfiles/dwm.desktop /usr/share/xsessions

mkdir ~/.config/picom/
rm ~/.config/picom/picom.conf
ln -sv ~/.dotfiles/picom.conf ~/.config/picom/ 

rm -rf ~/.config/nvim
mkdir ~/.config/nvim
ln -sv ~/.dotfiles/nvim/coc-settings.json ~/.config/nvim/ 
ln -sv ~/.dotfiles/nvim/init.vim ~/.config/nvim/ 

rm -rf ~/.config/ranger
mkdir ~/.config/ranger
ln -sv ~/.dotfiles/ranger/rc.conf ~/.config/ranger/ 
ln -sv ~/.dotfiles/ranger/rifle.conf ~/.config/ranger/ 

rm -rf ~/.config/rofi
mkdir ~/.config/rofi
mkdir ~/.config/rofi/themes
ln -sv ~/.dotfiles/rofi/config ~/.config/rofi/ 
ln -sv ~/.dotfiles/rofi/themes/onedark.rasi ~/.config/rofi/themes/ 

mkdir ~/.local/bin
ln -sv ~/.dotfiles/scripts/pdfshrink ~/.local/bin/ 
chmod +x ~/.dotfiles/scripts/pdfshrink
ln -sv ~/.dotfiles/scripts/launchspt ~/.local/bin/ 
chmod +x ~/.dotfiles/scripts/launchspt
ln -sv ~/.dotfiles/scripts/rofi-power-menu ~/.local/bin/ 
chmod +x ~/.dotfiles/scripts/rofi-power-menu

printf " dotfiles successfully installed\n"
sleep2
