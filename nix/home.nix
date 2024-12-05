{ config, pkgs, osConfig, ... }:

{
  home.username = "alex";
  home.homeDirectory = "/home/alex";
  programs.home-manager.enable = true;
  home.stateVersion = "25.05";

  programs.git ={ 
    enable = true;
    userName = "Alexander Popov";
    userEmail = "alexander.popov233@gmail.com";
  }
}
