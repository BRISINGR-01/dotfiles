{ config, pkgs, osConfig, ... }:

let
  packages = import ../../nix/packages.nix;
  aliases = import ../../nix/terminal/aliases.nix;
in {
  imports = [
    # ../../nix/system/hardware.nix
    # ../../nix/system/general.nix
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

  # nix.package = pkgs.nix;
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };

  # nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
