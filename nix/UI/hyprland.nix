{ config, lib, pkgs, ... }:

{
  programs = {
    regreet = {
      enable = true;
      settings = {
        background = {
          path = "/home/alex/dotfiles/assets/greet-wallpaper.jpg";
          fit = "Contain";
        };

        GTK = { application_prefer_dark_theme = true; };
        commands = {
          reboot = [ "systemctl" "reboot" ];
          poweroff = [ "systemctl" "poweroff" ];
          x11_prefix = [ "startx" "/usr/bin/env" ];
        };

        appearance = { greeting_msg = "Welcome back!"; };

        widget = {
          clock = {
            format =
              "%a %H:%M %e %b"; # See https://docs.rs/jiff/0.1.14/jiff/fmt/strtime/index.html#conversion-specifications
          };
        };
      };
    };
    hyprlock.enable = true;
    # ydotool.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  services = {
    hypridle.enable = true;
    gvfs.enable = true;
    # greetd.settings.default_session = {
    #   command =
    #     "${pkgs.greetd.tuigreet}/bin/tuigreet --sessions ${config.services.xserver.displayManager.sessionData.desktops}/share/xsessions:${config.services.xserver.displayManager.sessionData.desktops}/share/wayland-sessions --remember --remember-user-session";
    #   user = "greeter";
    # };
  };
}
