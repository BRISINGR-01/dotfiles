{ pkgs }:

with pkgs; [
  obsidian
  google-chrome
  firefox
  docker
  vscode
  minecraft
  prismlauncher
  authenticator
  wlogout
  beeper
  blender
  nautilus
  torrential
  vlc
  blueman
  libreoffice

  # terminal
  waveterm
  fish
  starship
  ghostty
  tmux
  tmuxinator

  #terminal utils
  fzf
  tree
  moc
  z-lua
  thefuck
  stow
  links2
  cava
  yt-dlp
  bat
  wl-clipboard
  gh
  fx
  jq
  tzupdate
  # inputs.superfile.packages.${system}.default # spf

  # development tools
  neovim
  btop
  systemctl-tui
  lazygit
  lazydocker
  cliphist
  fuzzel
  zellij

  # "ethical" hacking
  nmap
  ghidra
  metasploit
  binsider

  # Hyprland
  hyprsunset
  hyprpicker
  udiskie
  hyprpolkitagent
  waybar
  eww
  hyprlandPlugins.hy3
  hypridle
  hyprlock
  libnotify
  brightnessctl
  blueman
  networkmanagerapplet
  grimblast
  dunst

  # programming
  git
  nodejs_22
  yarn
  go
  gcc
  python3
  poetry
  bun
  rustc
  cargo
  lua

  # nix
  home-manager
  nixfmt-classic
]
