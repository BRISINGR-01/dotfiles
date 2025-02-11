{ config, lib, pkgs, ... }:

let aliases = import ./aliases.nix;
in {
  users.defaultUserShell = pkgs.fish;
  programs = {
    fish.enable = true;
    bash.enable = false;
    ghostty.enable = true;
    fish.defaultShell = true;
  };

  programs.bash.shellAliases = aliases;
  # environment.shellAliases = aliases;
  programs.fish.shellAliases = aliases;
  programs.fish.useBabelfish = true;
}
