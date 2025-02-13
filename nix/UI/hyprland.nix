{ config, lib, pkgs, ... }:

{
  programs = {
    regreet.enable = true;
    hyprlock.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  services = {
    hypridle.enable = true;
    gvfs.enable = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
