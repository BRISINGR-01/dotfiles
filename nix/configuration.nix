{ config, lib, pkgs, ... }:

let packages = import /home/alex/dotfiles/nix/packages.nix;
in {
  imports =
    [ ./hardware-configuration.nix ./hyprland.nix ]; # <home-manager/nixos> ];

  hardware = {
    pulseaudio.enable = false;
    #   graphics.enable = true;
    #   nvidia.modesetting.enable = true;
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    # grub.enable = true;
    # grub.useOSProber = true;
  };

  networking = {
    wireless.iwd.enable = true;
    hostName = "alex-nixos";
    networkmanager.enable = true;
  };

  fonts.packages = with pkgs;
    [ (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; }) ];

  time.timeZone = "Europe/Amsterdam";
  # time.timeZone = "Europe/Sofia";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "nl_NL.UTF-8";
      LC_IDENTIFICATION = "nl_NL.UTF-8";
      LC_MEASUREMENT = "nl_NL.UTF-8";
      LC_MONETARY = "nl_NL.UTF-8";
      LC_NAME = "nl_NL.UTF-8";
      LC_NUMERIC = "nl_NL.UTF-8";
      LC_PAPER = "nl_NL.UTF-8";
      LC_TELEPHONE = "nl_NL.UTF-8";
      LC_TIME = "nl_NL.UTF-8";
    };
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    audio.enable = true;
    jack.enable = true;
  };

  users.users = {
    alex = {
      isNormalUser = true;
      description = "Alex";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };

  environment.variables = { NIXPKGS_ALLOW_BROKEN = 1; };
  environment.systemPackages = packages { pkgs = pkgs; };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  programs = {
    fish.enable = false;
    nix-ld.enable = true;
    nix-ld.libraries = [ ];
  };

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.extraHosts = ''
    127.0.0.1 cooleseite.at
  '';

  # home-manager.useUserPackages = true;
  # home-manager.backupFileExtension = "bp";
  # home-manager.users.alex = { pkgs, ... }: {
  #   home.packages = [ ];
  #   programs.fish = {
  #     enable = true;
  #     shellInit = ''
  #       if status is-interactive
  #         set -g fish_greeting
  #       end
  #
  #       thefuck --alias | source
  #     '';
  #   };
  #   programs.git = {
  #     enable = true;
  #     userName = "Alexander Popov";
  #     userEmail = "alexander.popov233@gmail.com";
  #   };
  #
  #   home.stateVersion = "24.11";
  # };
  #
  system.stateVersion = "24.11";
}

