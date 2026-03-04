{ pkgs }:

with pkgs; [
  python313Packages.inotify-simple
  platformio
	arduino
  simple-mtpfs
  postman
  # python312Packages.invoke
  # poedit
  gnumake
  neovim
  btop
  systemctl-tui
  lazygit
  lazydocker
  cliphist
  ffmpeg
]
