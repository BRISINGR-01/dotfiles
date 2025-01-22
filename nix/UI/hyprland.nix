{ config, lib, pkgs, ... }:

{
  services.xserver.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.regreet.enable = true;
  environment.sessionVariables = { NIXOS_OZONE_WL = "1"; };
}
