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
  # gpaste
  wlogout
  beeper
  blender
  nautilus

  # terminal
  fish
  ghostty
  tmux
  tmuxinator
  fishPlugins.transient-fish

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
  # inputs.superfile.packages.${system}.default # spf

  # development tools
  neovim
  btop
  lazygit
  lazydocker

  # "ethical" hacking
  nmap
  ghidra
  metasploit
  binsider

  # Hyprland
  hyprsunset
  hyprpicker
  lxqt.lxqt-policykit
  udiskie
  hyprpolkitagent
  polkit
  polkit_gnome
  waybar
  eww

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

  # other
  nixfmt-classic
]
