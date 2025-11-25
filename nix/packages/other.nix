{ pkgs }:
with pkgs; [
  nemu
  eduvpn-client
  wineWowPackages.stable
  quickemu
  hunspellDicts.es_ES
  ffmpeg
  ollama
]