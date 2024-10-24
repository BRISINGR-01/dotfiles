{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix <home-manager/nixos> ./gnome.nix ];

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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
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

  users.users.alex = {
    isNormalUser = true;
    description = "Alex";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.fish;
    packages = with pkgs; [ ];
  };

  programs = {
    firefox.enable = true;
    fish.enable = true;
  };

  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
  nixpkgs.config.allowUnfree = true;

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
    nixfmt
    # inputs.superfile.packages.${system}.default # spf

    # hacking
    nmap
    ghidra
    metasploit
    binsider

    # programming
    git
    nodejs_22
    yarn
    go
    gcc
    python3
    poetry
    # rust
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  fonts.packages = with pkgs;
    [ (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; }) ];

  # services.openssh.enable = true;

  # home-manager.backupFileExtension = "backup";
  # home-manager.useUserPackages = true;
  # home-manager.users.alex = { pkgs, ... }: {
  #   imports = [ /home/alex/dotfiles/home.nix ];

  # The state version is required and should stay at the version you originally installed.
  #   home.stateVersion = "24.05";
  # };
  system.stateVersion = "24.05";
}

