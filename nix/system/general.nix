{ config, lib, pkgs, ... }:

{
  # time.timeZone = "Europe/Amsterdam";
  # time.timeZone = "Europe/Sofia";

  fonts.packages = with pkgs;
    [ (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; }) ];

  networking = {
    hostName = "alex-nixos";
    wireless.iwd.enable = true;
    networkmanager.enable = true;
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    audio.enable = true;
    jack.enable = true;
  };

  networking.extraHosts = ''
    127.0.0.1 cooleseite.at
  '';
}
