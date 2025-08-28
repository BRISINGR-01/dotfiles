{ config, lib, pkgs, ... }:

{
  imports = [ "/home/alex/dotfiles/nix/system/timezone.nix" ];

  nix.settings.download-buffer-size = 200;

  programs = {
    yazi = { enable = true; };
    # java = {
    #   enable = true;
    #   package = (pkgs.jdk21.override { enableJavaFX = true; });
    # };
    ydotool.enable = true;
    virt-manager.enable = true;
  };

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

  fonts.packages = [ pkgs.nerd-fonts.fira-code ];

  networking = {
    hostName = "alex-nixos";
    wireless.iwd.enable = true;
    networkmanager.enable = true;
  };

  services = {
    blueman.enable = true;
    openssh.enable = true;
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      audio.enable = true;
      jack.enable = true;
    };
    upower = {
      enable = true;
      percentageLow = 15;
      percentageCritical = 5;
      percentageAction = 4;
      criticalPowerAction = "Hibernate";
    };
    gnome.gnome-keyring.enable = true;
  };

  networking.extraHosts = ''
    127.0.0.1 cooleseite.at
  '';

  environment.pathsToLink = [ "/bin" ];
  nixpkgs.config.android_sdk.accept_license = true;
}

