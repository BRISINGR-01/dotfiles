{ config, lib, pkgs, ... }:

let swayConfig = pkgs.writeText "greetd-sway-config" ''
    exec "${pkgs.greetd.gtkgreet}/bin/gtkgreet -l; swaymsg exit"
    bindsym Mod4+shift+e exec swaynag -t warning -m 'hi' -b 'Power Off' 'systemctl poweroff'  -b 'Restart' 'systemctl reboot'
'';
in
{
  imports = [
    ./hardware-configuration.nix
    # <home-manager/nixos>
  ];

  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # boot.loader.grub.enable = true;
  # boot.loader.grub.useOSProber = true;

  networking.hostName = "alex-nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
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

  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  # services.xserver.xkb = {
  #   layout = "us";
  #   variant = "";
  # };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.sway}/bin/sway --config ${swayConfig}";
	};
      };
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # audio.enable = true;
    # jack.enable = true;
  };
  # services.wireplumber.enable = true;

  users.users.alex = {
    isNormalUser = true;
    description = "Alex";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [];
  };

  programs = {
    firefox.enable = true;
    fish.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    # apps 
    obsidian
    pkgs.google-chrome
    docker
    vscode
    # pkgs.minecraft
    authenticator
    gpaste
    
    # terminal
    alacritty
    kitty
    neovim
    vim
    fzf
    cava
    moc
    links2
    tmux
    tmuxinator
    pkgs.fishPlugins.transient-fish
    z-lua
    thefuck
    jq
    stow
    yt-dlp
    pkgs.kitty # required for the default Hyprland config
    bat
    xsel
    # inputs.superfile.packages.${system}.default # spf
    
    # temp
    # pkgs.waybar
    # pkgs.eww
    # pkgs.dunst
    # libnotify
    # rofi-wayland
    # pavucontrol
    # pipewire
    # wireplumber

    # programming
    git
    go
    gcc
    nodejs_22
    yarn
    python3
    poetry
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.etc."greetd/environments".text = ''
    sway
    fish
    bash
    startxfce4
  '';

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  ];

  # services.openssh.enable = true;

  system.stateVersion = "24.05";

  # home-manager.backupFileExtension = "backup";
  # home-manager.useUserPackages = true;
  # home-manager.users.alex = { pkgs, ... }: {
  #   imports = [ /home/alex/dotfiles/home.nix ];

    # The state version is required and should stay at the version you originally installed.
  #   home.stateVersion = "24.05";
  # };
}
