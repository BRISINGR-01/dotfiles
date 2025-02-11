{ config, lib, pkgs, ... }:

{
  imports = [ "/home/alex/dotfiles/nix/system/timezone.nix" ];
  # services.gnome.gnome-keyring.enable = true;

  home-manager.backupFileExtension = "bp";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  fonts.packages = with pkgs;
    [ (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; }) ];

  networking = {
    hostName = "alex-nixos";
    wireless.iwd.enable = true;
    networkmanager.enable = true;
  };

  services = {
    blueman.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      audio.enable = true;
      jack.enable = true;
    };
  };

  networking.extraHosts = ''
    127.0.0.1 cooleseite.at
  '';
}
