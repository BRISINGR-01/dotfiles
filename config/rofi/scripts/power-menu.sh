#!/bin/bash

# CMDs
uptime="$(uptime | cut -d 's/up' -f1)"
host=$(hostname)

shutdown=""
suspend=""
reboot=""
logout=""

chosen=$(
  echo -e "$shutdown\n$suspend\n$reboot\n$logout" | rofi -dmenu \
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
