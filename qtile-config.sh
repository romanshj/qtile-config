#!/bin/sh
set -euo pipefail;



qtile_path="$HOME/.config/qtile/"



function doGet {
    git pull origin master
    ###
    if [[ -f config.py ]] ; then
    	cp ./config.py $qtile_path
    fi
    ###
    if [[ -f autostart.sh ]] ; then 
    	cp ./autostart.sh $qtile_path
    fi
}


function doPut {
    if [[ -f "$qtile_path/config.py" ]] ; then 
        cp "$qtile_path/config.py" ./ 
    fi
    ###
    if [[ -f "$qtile_path/autostart.sh" ]] ; then
        cp "$qtile_path/autostart.sh" ./
    fi
    ###
    git add .
    git commit -m "updated"
    git push origin master
}


agrv=`getopt "get:put" $*`

while [[ $# -gt 0 ]] ; do
  case $1 in
	  get) doGet 
	       shift 
	  ;;
	  put) doPut 
               shift
	  ;; 
  esac
done
