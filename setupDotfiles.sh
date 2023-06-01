#!/usr/bin/env bash

echo "checking to see if stow is installed"

CONFIG_LOCATION=$HOME/.config/

PACKS=("fish" "hypr" "kitty" "omf" "pulse" "neofetch" "wofi" "mako" "swaylock" "wlogout" "gtk-3.0" "xsettingsd" "waybar" "cava")

if [[ -x "$(command -v stow)" ]]; then
  echo "found stow, proceding to link dotfiles "
  else
    command
    echo "couldn't find stow, exiting the linker"
    exit
fi

read -rep $' IMPORTANT NOTE: this script DOES NOT back up your currecnt configurations and IT WILL rewrite them, continue? (y,n) ' CON

if [[ $CON == "Y" || $CON == "y" ]]; then
  echo "continuing with the installations!"
  sleep 2
else
  echo "exiting installation..."
  exit 
fi

echo "checking if the required directories exist"
for PACK in ${PACKS[@]}
do
  ([ -d "$CONFIG_LOCATION$PACK" ] && echo "Directory $CONFIG_LOCATION$PACK exists!") || (echo "Couldn't find directory $CONFIG_LOCATION/$PACK ! Attempting to create..." && mkdir $CONFIG_LOCATION/$PACK)
done
for PACK in ${PACKS[@]}
do
  echo "stowing $PACK ..."
  stow --adopt --target=$CONFIG_LOCATION$PACK --dir=.config/ $PACK 
done

