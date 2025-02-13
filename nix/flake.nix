# flake.nix

{

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    # hycov = {
    #   url = "github:DreamMaoMao/hycov";
    #   inputs.hyprland.follows = "hyprland";
    # };
  };

  outputs = { nixpkgs, home-manager, hyprland, hycov, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."alex@alex-nixos" =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;

          modules = [
            /home/alex/.config/home-manager/home.nix
            hyprland.homeManagerModules.default
            {
              wayland.windowManager.hyprland = {
                enable = true;
                package = hyprland.packages."${pkgs.system}".hyprland;
                # plugins = [ hycov.packages.${pkgs.system}.hycov ];
                extraConfig = ''
                  bind = ALT,tab,hycov:toggleoverview
                  bind=ALT,left,hycov:movefocus,l
                  bind=ALT,right,hycov:movefocus,r
                  bind=ALT,up,hycov:movefocus,u
                  bind=ALT,down,hycov:movefocus,d

                  plugin {
                      hycov {
                        overview_gappo = 60 #gaps width from screen
                        overview_gappi = 24 #gaps width from clients
                  	    hotarea_size = 10 #hotarea size in bottom left,10x10
                  	    enable_hotarea = 1 # enable mouse cursor hotarea
                      }
                  }
                '';
              };
            }
          ];
        };
    };
}
