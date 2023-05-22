#!/usr/bin/env bash

echo "checking to see if stow is installed"

CONFIG_LOCATION=$HOME/.config/

PACKS=("fish" "hypr" "kitty" "omf" "pulse" "neofetch" "wofi" "mako" "swaylock" "wlogout")

if [[ -x "$(command -v stow)" ]]; then
  echo "found stow, proceding to link dotfiles "
  else
    command
    echo "couldn't find stow, exiting the linker"
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

