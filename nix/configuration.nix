{ config, lib, pkgs, ... }:

let packages = import /home/alex/dotfiles/nix/packages.nix;
in {
  imports = [
    /home/alex/dotfiles/nix/system/hardware.nix
    /home/alex/dotfiles/nix/system/general.nix
    /home/alex/dotfiles/nix/system/nix.nix
    /home/alex/dotfiles/nix/UI/hyprland.nix
    <home-manager/nixos>
  ];

  users.users = {
    alex = {
      isNormalUser = true;
      description = "Alex";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
    };
  };

  environment.systemPackages = packages { pkgs = pkgs; };
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;

  # virtualisation.docker = {
  #   enable = true;
  #   rootless = {
  #     enable = true;
  #     setSocketVariable = true;
  #   };
  # };
}
