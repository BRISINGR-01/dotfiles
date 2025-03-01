{ config, lib, pkgs, ... }:

{
  programs = {
    regreet.enable = true;
    hyprlock.enable = true;
    # ydotool.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  services = {
    hypridle.enable = true;
    gvfs.enable = true;
  };
}
