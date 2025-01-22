{ config, lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # services.gnome.core = true;

  # xdg.gsettings = {
  #   "org.gnome.desktop.interface" = {
  #     monospace-font-name = "FiraCode Nerd Font Mono 12";
  #   };

  #   "org.gnome.desktop.background" = {
  #     picture-uri =
  #       "file://${config.users.users.alex.home}/dotfiles/assets/2024-10-06-00-32-10-snowy-mountains-and-night-sky-3840x2160-v0-m5k7gi3fmf8c1.webp";
  #   };

  #   "org.gnome.settings-daemon.plugins.media-keys" = { };

  #   # Custom keybindings
  #   "org.gnome.settings-daemon.plugins.media-keys.custom-keybindings" = [{
  #     name = "Open Terminal";
  #     command = "gnome-terminal";
  #     binding = "<Super>t";
  #   }];
  # };
}
