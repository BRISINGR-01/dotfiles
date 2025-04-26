{ pkgs }:

with pkgs; [
  clippy
  python312Packages.invoke
  poedit
  gnumake
  neovim
  btop
  systemctl-tui
  lazygit
  lazydocker
  cliphist
  fuzzel
  zellij
]