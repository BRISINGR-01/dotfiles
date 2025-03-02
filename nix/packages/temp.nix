{ pkgs }:

with pkgs; [
  apt
  linuxHeaders
  openconnect
  virt-viewer
  elmPackages.elm
  python312Packages.jupyter
  vscode-extensions.ms-toolsai.jupyter
]
