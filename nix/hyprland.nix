{ config, lib, pkgs, ... }:

{
  services.xserver.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.regreet.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = "alex";
        command =
          "${pkgs.greetd.greetd}/bin/agreety --cmd ${pkgs.hyprland}/bin/Hyprland";
      };
    };
  };

  environment.variables = [
    pkgs.waybar
    pkgs.eww
    pkgs.dunst
    libnotify
    rofi-wayland
    hyprpolkitagent
    polkit_gnome
    nwg-look
    pavucontrol
  ];

  environment.sessionVariables = { NIXOS_OZONE_WL = "1"; };

  environment.etc."greetd/environments".text = ''
    Hyprland
    Gnome
    fish
  '';

}
