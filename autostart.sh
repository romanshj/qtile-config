#!/bin/sh

###
picom --config ~/.config/picom.conf &

###
polkit_path="/usr/lib/polkit-gnome"

if [[ -d $polkit_path ]] ; then
  cd $polkit_path
  ./polkit-gnome-authentication-agent-1 &
fi

###
killall gxkb ; gxkb &
setxkbmap -layout us,ru,ua &
setxkbmap -option 'grp:alt_shift_toggle' &
