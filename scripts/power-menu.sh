#!/bin/bash

# CMDs
uptime="$(uptime | sed -e 's/up //g')"
host=$(hostname)

shutdown=""
suspend=""
reboot=""
logout=""

chosen=$(
  echo -e "$shutdown\n$suspend\n$reboot\n$logout" | rofi -dmenu \
    -p "Uptime: $uptime" \
    -mesg "Uptime: $uptime" \
    -theme ~/dotfiles/config/rofi/power-menu.rasi
)

echo "$chosen"
exit

case ${chosen} in
$shutdown)
  systemctl poweroff
  ;;
$reboot)
  systemctl reboot
  ;;
$logout)
  hyprlock
  hyprctl dispatch dpms off
  ;;
$suspend)
  systemctl suspend
  ;;
esac
