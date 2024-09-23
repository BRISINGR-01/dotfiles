#!/bin/bash

min () {
	sudo apt install xsel awk xargs curl grep jq fzf git tmux fish nvim nnn ssh stow
	dotfiles
	transient_fish
}

all () {
	min
	sudo apt install chrome firefox code obsidian cava gcc make python node go docker tmuxinator mocp fuck
	gpaste
	font
}

gpaste () {
	git clone https://github.com/Keruspe/GPaste.git &&
	cd GPaste
	mkdir builddir
	cd builddir
	sudo apt install ninja meson &&
	meson .. &&
	ninja &&
	sudo ninja install &&
	sudo glib-compile-schemas /usr/share/glib-2.0/schemas/ &&
	cd ..
	rm -rf  GPaste
}

transient_fish () {
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
  fisher install zzhaolei/transient.fish
}

dotfiles () {
	cd ~
	if [ -f .bashrc ]; then
		mv .bashrc .bashrc.bak 
	fi
	git clone https://github.com/BRISINGR-01/dotfiles
	cd dotfiles
	stow .
	cd ~
	source .bashrc
}

font () {
  curl "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip" > ./FiraCode.zip
	unzip ./FiraCode.zip -d ~/.local/share/fonts
	rm ./FiraCode.zip
}

if [ "$1" == "min" ]; then
	min
else
 all
fi
