#!/bin/bash
song=$(playerctl metadata --format "Title: {{ title }}\nArtist: {{ artist }}\nAlbum: {{ album }}")
cover=$(playerctl metadata  | awk '/artUrl/ {print $3}')
curl $cover > ~/.cache/cover.jpg
notify-send "Spotify" "$song" --icon=~/.cache/cover.jpg
