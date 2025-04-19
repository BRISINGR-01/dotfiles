{ pkgs }:

with pkgs; [
  wineWowPackages.stable
  quickemu
  hunspellDicts.es_ES
  ffmpeg
  ollama
]
