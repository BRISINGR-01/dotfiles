{ config, lib, pkgs, ... }:

{
  imports = [ "/home/alex/dotfiles/nix/system/timezone.nix" ];

  nix.settings.download-buffer-size = 200;

  programs.java = {
    enable = true;
    package = (pkgs.jdk21.override { enableJavaFX = true; });
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

  fonts.packages = with pkgs;
    [ (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; }) ];

  networking = {
    hostName = "alex-nixos";
    wireless.iwd.enable = true;
    networkmanager.enable = true;
  };

  services = {
    tailscale.enable = true;
    blueman.enable = true;
    openssh.enable = true;
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
  };

  networking.extraHosts = ''
    127.0.0.1 cooleseite.at
  '';

  environment.pathsToLink = [ "/bin" ];

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [
          (pkgs.OVMF.override {
            secureBoot = true;
            tpmSupport = true;
          }).fd
        ];
      };
    };
  };
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "alex" ];
  virtualisation.spiceUSBRedirection.enable = true;
}
