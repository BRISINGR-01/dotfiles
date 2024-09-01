#!/bin/bash

min() {

}

gpaste() {
	git clone https://github.com/Keruspe/GPaste.git
	cd GPaste
	mkdir builddir
	cd builddir
	meson ..
	ninja
	sudo ninja install
	sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
}

font() {
	
  curl "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip" > ./FiraCode.zip
}