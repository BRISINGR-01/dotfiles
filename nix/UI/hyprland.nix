{ config, lib, pkgs, ... }:

{
  # imports = [ /home/alex/dotfiles/Lightdm-webkit2-greeter/module.nix ];

  # nixpkgs.overlays = [ (import /home/alex/dotfiles/nix/overlay.nix) ];

  # services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.displayManager.lightdm.greeter.enable = true;
  # services.xserver.enable = true;
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.displayManager.sddm.wayland.enable = true;
  #  services.xserver.displayManager.sddm.theme = "where_is_my_sddm_theme";

  programs = {
    regreet.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
