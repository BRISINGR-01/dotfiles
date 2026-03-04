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
    sessionPath = [
      "${home}/dotfiles/scripts"
      "${home}/flutter/bin"
      "${home}/bin"
      "${home}/alex/.cargo/bin"
    ];
    username = "alex";
    sessionVariables = {
      HYPRCURSOR_SIZE = "24";
      HYPRCURSOR_THEME = "-catppuccin-mocha-dark-cursors";
      FZF_DEFAULT_OPTS =
        "--color=fg:#d0d0d0,fg+:#d0d0d0,bg+:#2c323c --color=hl:#81A2BE,hl+:#5fd7ff,info:#81A2BE,marker:#81A2BE --color=prompt:#81A2BE,spinner:#81A2BE,pointer:#81A2BE,header:#72b8c7 --color=border:#81A2BE,label:#aeaeae,query:#d9d9d9 --border=\"rounded\" --preview-window=\"border-rounded\" --pointer=\"\" --layout reverse --info inline --tmux 60%,80% --preview 'cat {}'";
    };
    homeDirectory = home;
    stateVersion = "25.05";
    enableNixpkgsReleaseCheck = false;

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
		atuin = {
			enable = true;
		};
    fish = {
      enable = true;
      shellAliases = aliases;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
        tv init fish | source
        zoxide init fish | source

        function fish_user_key_bindings
          fish_default_key_bindings -M insert
          fish_vi_key_bindings --no-erase insert
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
    systemd.enable = true;
    xwayland.enable = true;
    extraConfig = ''
      source=~/dotfiles/config/hypr/hyprland.conf 

      plugin=${pkgs.hyprlandPlugins.hypr-dynamic-cursors}/lib/libhypr-dynamic-cursors.so
      plugin=${pkgs.hyprlandPlugins.hy3}/lib/libhy3.so
    '';
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };

  # i18n.inputMethod.fcitx5.enable = false;

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

  gtk = {
    enable = true;
    theme = { name = "Adwaita-dark"; };
  };
}
