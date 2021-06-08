#!/bin/sh

###
picom --config ~/.config/picom.conf &

###
polkit_path="/usr/lib/polkit-gnome"

if [[ -d $polkit_path ]] ; then
  for i in `ls $polkit_path`
     sh -c $i ; break
  done
fi

###
gxkb &
