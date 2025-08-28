{ config, lib, pkgs, ... }:

{
  programs = {
    # regreet = {
    #   enable = true;
    #   settings = {
    #     background = {
    #       path = "/etc/greetd/bg.jpg";
    #       fit = "Contain";
    #     };

    #     GTK.application_prefer_dark_theme = true;
    #     commands = {
    #       reboot = [ "systemctl" "reboot" ];
    #       poweroff = [ "systemctl" "poweroff" ];
    #       x11_prefix = [ "startx" "/usr/bin/env" ];
    #     };

    #     appearance = { greeting_msg = "Welcome back!"; };

    #     widget = {
    #       clock = {
    #         format =
    #           "%a %H:%M %e %b"; # See https://docs.rs/jiff/0.1.14/jiff/fmt/strtime/index.html#conversion-specifications
    #       };
    #     };
    #   };
    # };

    hyprlock.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };
  # environment.etc."greetd/bg.jpg".source =
  #   "/home/alex/dotfiles/assets/greet-wallpaper.jpg";

  services = {
    hypridle.enable = true;
    gvfs.enable = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command =
          "${pkgs.tuigreet}/bin/tuigreet -r --time --cmd Hyprland --asterisks-char ࿋";
      };
      GTK.application_prefer_dark_theme = true;
    };
  };
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
