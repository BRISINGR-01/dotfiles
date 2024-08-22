#!/bin/bash

min() {

}

gpaste() {
	mkdir builddir
	cd builddir
	meson ..
	ninja
	sudo ninja install
	sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
}
