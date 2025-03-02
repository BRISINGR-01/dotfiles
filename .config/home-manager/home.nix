{ config, pkgs, osConfig, ... }:

let
  packages = import ../../nix/packages;
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
    sessionPath = [ "~/bin" "~/dotfiles/bin" "~/.config/hypr" ];
    username = "alex";
    sessionVariables = {
      # HYPRCURSOR_SIZE = "24";
      # HYPRCURSOR_THEME = "catppuccin-mocha-dark-cursors";
    };
    homeDirectory = "/home/alex";
    stateVersion = "24.11";
    packages = packages { pkgs = pkgs; };
    # pointerCursor = {
    #   gtk.enable = true;
    #   name = "Catppuccin-Mocha-Blue-Cursors";
    #   package = pkgs.catppuccin-cursors.mochaBlue;
    #   size = 16;
    # };
    file = {
      ".config/hypr/hypridle.conf".source = ../../conf/hypr/hypridle.conf;
      ".config/hypr/hyprlock.conf".source = ../../conf/hypr/hyprlock.conf;
    };
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
        tv init fish | source
        thefuck --alias | source
      '';
      plugins = [
        {
          name = "transient-fish";
          src = pkgs.fishPlugins.transient-fish.src;
        }
        {
          name = "z";
          src = pkgs.fishPlugins.z;
        }
      ];
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
    enable = true;
    systemd.enable = false;
    xwayland.enable = true;
    extraConfig = ''
      source=~/dotfiles/conf/hypr/hyprland.conf 

      plugin=${pkgs.hyprlandPlugins.hypr-dynamic-cursors}/lib/libhypr-dynamic-cursors.so
      plugin=${pkgs.hyprlandPlugins.hy3}/lib/libhy3.so
      plugin=${pkgs.hyprlandPlugins.hyprspace}/lib/libhyprspace.so
    '';
  };

  services = {
    dunst = {
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
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "google-chrome.desktop";
      "application/pdf" = "zathura.desktop";
      "image/png" = "swayimg.desktop";
      "image/jpeg" = "swayimg.desktop";
      "image/gif" = "swayimg.desktop";
      "image/webp" = "swayimg.desktop";
      "image/svg+xml" = "swayimg.desktop";
      "x-scheme-handler/http" = "google-chrome.desktop";
      "x-scheme-handler/https" = "google-chrome.desktop";
      "x-scheme-handler/about" = "google-chrome.desktop";
      "x-scheme-handler/unknown" = "google-chrome.desktop";
      "x-scheme-handler/mailto" = "google-chrome.desktop";
      "x-scheme-handler/lunarclient" = "lunarclient.desktop";
    };
  };
}
