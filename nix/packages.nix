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

  # terminal
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
  # inputs.superfile.packages.${system}.default # spf

  # development tools
  neovim
  btop
  systemctl-tui
  lazygit
  lazydocker
  cliphist
  fuzzel

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
  polkit-kde-agent
  waybar
  eww
  hyprlandPlugins.hy3

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
