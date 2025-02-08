{ config, pkgs, osConfig, ... }:

let
  packages = import ../../nix/packages.nix;
  aliases = import ../../nix/terminal/aliases.nix;
in {
  imports = [
    # ../../nix/system/hardware.nix
    # ../../nix/system/general.nix
    # ../../nix/system/timezone.nix
    # ../../nix/system/nix.nix
    # ../../nix/UI/hyprland.nix
    # ../../nix/terminal/default.nix
  ];

  home = {
    username = "alex";
    homeDirectory = "/home/alex";
    stateVersion = "24.11";
    packages = packages { pkgs = pkgs; };
  };

  programs = {
    git = {
      enable = true;
      userName = "Alexander Popov";
      userEmail = "alexander.popov233@gmail.com";
    };
    fish = {
      enable = true;
      shellAliases = aliases;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
      '';
      plugins = [{
        name = "transient-fish";
        src = pkgs.fishPlugins.transient-fish.src;
      }];
    };
    fuzzel = {
      enable = true;
      settings = {
        main = {
          prompt = ''"󰣉 "'';
          inner-pad = 10;
          exit-on-keyboard-focus-loss = true;
          terminal = "${pkgs.foot}/bin/foot";
          layer = "overlay";
        };
        colors = {
          background = "1e1e2edd";
          text = "cdd6f4ff";
          prompt = "bac2deff";
          placeholder = "7f849cff";
          input = "cdd6f4ff";
          match = "89b4faff";
          selection = "585b70ff";
          selection-text = "cdd6f4ff";
          selection-match = "89b4faff";
          counter = "7f849cff";
          border = "89b4faff";
        };
      };
    };
  };

  wayland.windowManager.hyprland = {
    # enable = true;

    plugins = [
      #  ${pkgs.hy3.packages.x86_64-linux.hy3}/lib/libhy3.so
      # legacyPackages.x86_64-linux.hyprlandPlugins.hy3
      # config.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hy3
      pkgs.hyprlandPlugins.hy3
    ];
  };

  services.dunst = {
    enable = true;
    settings = {
      global = {
        offset = "10x10";
        corner_radius = 10;
        indicate_hidden = "yes";
        frame_color = "#eceff1";
        frame_width = 2;
        browser = "${pkgs.google-chrome}/bin/google-chrome-stable";
        # The format of the message.  Possible variables are:
        #   %a  appname
        #   %s  summary
        #   %b  body
        #   %i  iconname (including its path)
        #   %I  iconname (without its path)
        #   %p  progress value if set ([  0%] to [100%]) or nothing
        #   %n  progress value if set without any extra characters
        #   %%  Literal %
        # Markup is allowed
      };

      urgency_normal = {
        background = "#37474f";
        foreground = "#eceff1";
        timeout = 5;
      };
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };
  # nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # systemd.user.services.update-timezone = {
  #   # description = "...";
  #   wantedBy = [ "multi-user.target" ];

  #   serviceConfig.ExecStart = "/home/alex/dotfiles/bin/update_timezone";
  #   serviceConfig.RemainAfterExit = false;
  # };
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "google-chrome.desktop";
      "application/pdf" = "swayimg.desktop";
      "image/png" = [ "swayimg.desktop" ];
      "image/jpeg" = [ "swayimg.desktop" ];
      "image/gif" = [ "swayimg.desktop" ];
      "image/webp" = [ "swayimg.desktop" ];
      "image/svg+xml" = [ "swayimg.desktop" ];
      "x-scheme-handler/http" = "google-chrome.desktop";
      "x-scheme-handler/https" = "google-chrome.desktop";
      "x-scheme-handler/about" = "google-chrome.desktop";
      "x-scheme-handler/unknown" = "google-chrome.desktop";
      "x-scheme-handler/mailto" = "google-chrome.desktop";
      "x-scheme-handler/lunarclient" = "lunarclient.desktop";
    };
  };
}
