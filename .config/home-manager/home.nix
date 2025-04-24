{ config, pkgs, osConfig, ... }:

let
  packages = import ../../nix/packages;
  aliases = import ../../nix/terminal/aliases.nix;
  home = "/home/alex";
  hyprpanel-flake =
    builtins.getFlake "${home}/dotfiles/ags/hyprpanel/flake.nix";
in {
  imports = [
    # ../../nix/system/hardware.nix
    # ../../nix/system/general.nix
    # ../../nix/system/timezone.nix
    # hyprpanel-flake.homeManagerModules.hyprpanel

    # ../../nix/system/nix.nix
    # ../../nix/UI/hyprland.nix
    # ../../nix/terminal/default.nix
  ];

  home = {
    sessionPath = [ "${home}/dotfiles/scripts" ];
    username = "alex";
    sessionVariables = {
      HYPRCURSOR_SIZE = "24";
      HYPRCURSOR_THEME = "catppuccin-mocha-dark-cursors";
    };
    homeDirectory = home;
    stateVersion = "24.11";
    packages = packages { pkgs = pkgs; };
    file = {
      ".config/hypr/hyprlock.conf".source =
        /home/alex/dotfiles/config/hypr/hyprlock.conf;
      ".tmux.conf".source = /home/alex/dotfiles/config/.tmux.conf;
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
        thefuck --alias | source
        zoxide init fish | source
        export RUST_SRC_PATH=(rustc --print sysroot)/lib/rustlib/rustc-src/rust/
        function y
          set tmp (mktemp -t "yazi-cwd.XXXXXX")
          yazi $argv --cwd-file="$tmp"
          if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
          end
          rm -f -- "$tmp"
        end
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
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    xwayland.enable = true;
    extraConfig = ''
      source=~/dotfiles/config/hypr/hyprland.conf 

      plugin=${pkgs.hyprlandPlugins.hypr-dynamic-cursors}/lib/libhypr-dynamic-cursors.so
      plugin=${pkgs.hyprlandPlugins.hy3}/lib/libhy3.so
      plugin=${pkgs.hyprlandPlugins.hyprspace}/lib/libhyprspace.so
    '';
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/plain" = "code.desktop";
      "text/html" = "brave.desktop";
      "application/pdf" = "zathura.desktop";
      "image/png" = "swayimg.desktop";
      "image/jpeg" = "swayimg.desktop";
      "image/gif" = "swayimg.desktop";
      "image/webp" = "swayimg.desktop";
      "image/svg+xml" = "swayimg.desktop";
      "x-scheme-handler/http" = "brave.desktop";
      "x-scheme-handler/https" = "brave.desktop";
      "x-scheme-handler/about" = "brave.desktop";
      "x-scheme-handler/unknown" = "brave.desktop";
      "x-scheme-handler/mailto" = "brave.desktop";
      "x-scheme-handler/lunarclient" = "lunarclient.desktop";
    };
  };
}
