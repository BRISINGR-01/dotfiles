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
  waybar
  beeper
  blender
  nautilus
  eww

  # terminal
  fish
  tree
  ghostty
  neovim
  vim
  fzf
  btop
  lazygit
  lazydocker
  hyprpolkitagent
  polkit
  polkit_gnome
  cava
  moc
  links2
  tmux
  tmuxinator
  fishPlugins.transient-fish
  z-lua
  thefuck
  jq
  stow
  yt-dlp
  kitty # required for the default Hyprland config
  bat
  xsel
  wl-clipboard
  nixfmt-classic
  gh
  fx
  # inputs.superfile.packages.${system}.default # spf

  # hacking
  nmap
  ghidra
  metasploit
  binsider

  # Hyprland
  hyprsunset
  hyprpicker
  lxqt.lxqt-policykit
  udiskie

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
]
