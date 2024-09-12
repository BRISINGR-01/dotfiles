#!/bin/bash

min () {
	sudo apt install xsel awk xargs curl grep jq fzf git tmux fish nvim nnn ssh
	transient_fish
}

all () {
	min
	sudo apt install chrome firefox code obsidian cava gcc make python node go docker tmuxinator mocp stow fuck
	gpaste
	dotfiles
	font
}

gpaste () {
	git clone https://github.com/Keruspe/GPaste.git
	cd GPaste
	mkdir builddir
	cd builddir
	meson ..
	ninja
	sudo ninja install
	sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
}

transient_fish () {
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
  fisher install zzhaolei/transient.fish
}

dotfiles () {
	cd ~
	mv .bashrc .bashrc.bak 
	git clone https://github.com/BRISINGR-01/dotfiles
	cd dotfiles
	stow .
	source ~/.bashrc
}

font () {
  curl "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip" > ./FiraCode.zip
	unzip ./FiraCode.zip -d ~/.local/share/fonts
	rm ./FiraCode.zip
}

if [ "$1" == "min" ]; then
	min
elif [ "$1" == "test" ]; then
	echo "test"
else
 all
fi