{ config, pkgs, osConfig, ... }:

{
  home.username = "alex";
  home.homeDirectory = "/home/alex";
  programs.home-manager.enable = true;
  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "Alexander Popov";
    userEmail = "alexander.popov233@gmail.com";
  };

  programs.gsettings = { enable = true; };

  dconf.settings = {
    enable = true;

    # You need quotes to escape '/'
    "org/gnome/desktop/interface" = { clock-show-weekday = true; };
    "org.gnome.desktop.background" = {
      picture-uri =
        "file://${config.users.users.alex.home}/dotfiles/assets/2024-10-06-00-32-10-snowy-mountains-and-night-sky-3840x2160-v0-m5k7gi3fmf8c1.webp";
    };
  };
}
