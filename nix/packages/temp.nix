{ pkgs }:

with pkgs; [
  elmPackages.elm
  python312Packages.jupyter
  vscode-extensions.ms-toolsai.jupyter
]
