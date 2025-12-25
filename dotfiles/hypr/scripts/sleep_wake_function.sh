#!/usr/bin/env sh
if pgrep -x "hypridle" >/dev/null ; then
      killall hypridle
      hyprctl notify 1 5000 "rgb(d20f39)" "Screen Sleeping [OFF]"
      hyprctl reload
      exit
else
   hyprctl notify 1 5000 "rgb(40a02b)" "Screen Sleeping [ON]"
   hypridle  
    exit 0
fi
exit 1

