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
sh -c "setxkbmap -layout us,ru,ua"
sh -c "setxkbmap -option 'grp:alt_shift_toggle'"

###
killall nm-applet ; nm-applet &

###
killall cbatticon ; cbatticon &
killall xfce4-power-manager ; xfce4-power-manager &
