{ config, lib, pkgs, ... }:

{
  programs = {
    regreet.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  services.xserver.enable = true;
  environment.sessionVariables = { NIXOS_OZONE_WL = "1"; };
}
