{ config, lib, pkgs, ... }:

let aliases = import ./aliases.nix;
in {
  programs = { fish.enable = false; };

  programs.bash.shellAliases = aliases;
  environment.shellAliases = aliases;
  programs.fish.shellAliases = aliases;
  programs.fish.useBabelfish = true;
}
