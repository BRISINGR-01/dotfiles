{ config, lib, pkgs, ... }:

{
  # imports = [ /home/alex/dotfiles/Lightdm-webkit2-greeter/module.nix ];

  # nixpkgs.overlays = [ (import /home/alex/dotfiles/nix/overlay.nix) ];

  services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.displayManager.lightdm.greeter.enable = true;

  programs = {
    # lightdm-webkit2-greeter.enable = true;
    regreet.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  # services.xserver.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
