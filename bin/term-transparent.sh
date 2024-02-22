#! /bin/bash
path="/org/gnome/terminal/legacy/profiles:/:a41e7b60-3225-4f8f-8125-428c23ebcb61/background-transparency-percent"
t="$(dconf read $path)"

if [[ $1 == "+" ]]; then
  if [[ $t == 100 ]]; then
    exit 0 
  fi

  t=$(($t + 5))
else
  if [[ $t == 0 ]]; then
    exit 0
  fi
  t=$(($t - 5))
fi

dconf write $path $t

