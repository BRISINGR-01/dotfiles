{ config, lib, pkgs, ... }:

let aliases = import ./aliases.nix;
in {
  programs = {
    fish.enable = true;
    ghostty.enable = true;
    fish.defaultShell = true;
  };

  programs.bash.shellAliases = aliases;
  # environment.shellAliases = aliases;
  programs.fish.shellAliases = aliases;
  programs.fish.useBabelfish = true;
}
