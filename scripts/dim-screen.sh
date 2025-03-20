#! /bin/bash

brightness=$(brightnessctl g)

for i in {1..100}; do
  sleep 0.04

  val=$(($brightness - (1000 * $i)))
  if [ $val -gt 0 ]; then
    brightnessctl set $(($brightness - (1000 * $i)))
  else
    break
  fi
done

sleep 5

for i in {1..100}; do
  sleep 0.04

  val=$(($brightness - (1000 * $i)))
  if [ $val -gt 0 ]; then
    brightnessctl set $(($brightness - (1000 * $i)))
  else
    break
  fi
done

sleep 2
