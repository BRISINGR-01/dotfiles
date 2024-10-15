{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      nixpkgs-fmt
      gnumake
    ];

    sessionVariables.NIXOS_OZONE_WL = "1";

    username = "alex";
    homeDirectory = "/home/alex";
    stateVersion = "24.05";
  };


  programs = {
    home-manager.enable = true;
    kitty.enable = true; # required for the default Hyprland config
    git = {
      enable = true;
      userName = "Alexander Popov";
      userEmail = "alexander.popov233@gmail.com";
    };
  };


  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind = [
      "$mod, F, exec, firefox"
      ", Print, exec, grimblast copy area"
    ]
    ++ (
      # workspaces
      # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
      builtins.concatLists (builtins.genList (i:
          let ws = i + 1;
          in [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        )
        9)
    );
  };
}