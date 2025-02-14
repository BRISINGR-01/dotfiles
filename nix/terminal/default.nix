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
  programs.fish.shellAliases = aliases;
  programs.fish.useBabelfish = true;

  environment.sessionVariables = {
    CHROME_EXECUTABLE = "google-chrome-stable";
    NIXOS_OZONE_WL = "1";
    YDOTOOL_SOCKET = "/home/alex/.ydotool_socket";
  };
}
