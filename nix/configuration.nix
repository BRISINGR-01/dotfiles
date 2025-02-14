{ config, lib, pkgs, ... }:

let packages = import /home/alex/dotfiles/nix/packages;
in {
  imports = [
    /home/alex/dotfiles/nix/system/hardware.nix
    /home/alex/dotfiles/nix/system/general.nix
    /home/alex/dotfiles/nix/system/nix.nix
    /home/alex/dotfiles/nix/UI
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
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
  };
  # virtualisation.docker = {
  #   enable = true;
  #   rootless = {
  #     enable = true;
  #     setSocketVariable = true;
  #   };
  # };
}
