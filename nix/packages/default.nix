{ pkgs }:

let
  apps = import ./apps.nix;
  dev = import ./dev.nix;
  hacking = import ./hacking.nix;
  hyprland = import ./hyprland.nix;
  nix = import ./nix.nix;
  other = import ./other.nix;
  programming = import ./programming.nix;
  ricing = import ./ricing.nix;
  temp = import ./temp.nix;
  terminal = import ./terminal.nix;
  terminal_utils = import ./terminal_utils.nix;
in with pkgs;
apps { pkgs = pkgs; } ++ terminal { pkgs = pkgs; }
++ terminal_utils { pkgs = pkgs; } ++ hacking { pkgs = pkgs; }
++ nix { pkgs = pkgs; } ++ dev { pkgs = pkgs; } ++ other { pkgs = pkgs; }
++ hyprland { pkgs = pkgs; } ++ ricing { pkgs = pkgs; }
++ programming { pkgs = pkgs; } ++ temp { pkgs = pkgs; } ++ [
  # inputs.superfile.packages.${system}.default # spf
]
