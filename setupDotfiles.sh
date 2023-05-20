#!/usr/bin/env bash

echo "checking to see if stow is installed"

CONFIG_LOCATION=$HOME/.config/

if [[ -x "$(command -v stow)" ]]; then
  echo "found stow, proceding to link dotfiles "
  else
    command
    echo "couldn't find stow, exiting the linker"
    exit
fi

for PACK in fish hypr kitty omf pulse neofetch
do
  echo "stowing $PACK ..."
  stow --adopt --target=$CONFIG_LOCATION/$PACK --dir=.config/ $PACK 
done

