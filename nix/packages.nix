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
  gpaste

  # terminal
  fish
  kitty
  neovim
  vim
  fzf
  # cava
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
  nixfmt-classic
  gh
  # inputs.superfile.packages.${system}.default # spf

  # hacking
  nmap
  ghidra
  metasploit
  binsider

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
