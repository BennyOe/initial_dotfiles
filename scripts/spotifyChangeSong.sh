#!/bin/bash
song=$(playerctl --player=spotifyd metadata --format "Title: {{ title }}\nArtist: {{ artist }}\nAlbum: {{ album }}")
cover=$(playerctl --player=spotifyd metadata  | awk '/artUrl/ {print $3}')
curl $cover > ~/.cache/cover.jpg
dunstify -u low -r 10 "Spotify" "$song" --icon=~/.cache/cover.jpg
