{ pkgs }:

with pkgs; [
  hunspell
  hunspellDicts.en-us
  yazi
  apt
  linuxHeaders
  openconnect
  virt-viewer
  elmPackages.elm
  python312Packages.jupyter
  vscode-extensions.ms-toolsai.jupyter
]
