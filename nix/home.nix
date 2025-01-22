{ config, pkgs, osConfig, ... }:

{
  home.username = "alex";
  home.homeDirectory = "/home/alex";
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";

  programs.git = {
    enable = true;
    userName = "Alexander Popov";
    userEmail = "alexander.popov233@gmail.com";
  };

  programs.gsettings = { enable = true; };

  wayland.windowManager.hyprland = {
    enable = true;

    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hy3
    ];
  };
}
