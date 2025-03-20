{ config, lib, pkgs, ... }:

let aliases = import ./aliases.nix;
in {
  users.defaultUserShell = pkgs.fish;
  programs = {
    fish = {
      enable = true;
      useBabelfish = true;
      shellAliases = aliases;
    };
    bash = {
      completion.enable = true;
      interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
      shellAliases = aliases;
    };
    tmux = {
      enable = true;
      plugins = with pkgs.tmuxPlugins; [
        sensible
        yank
        dracula
        # tmux-notify
        tmux-fzf
        # tmux-which-key
      ];
    };
  };

  environment = {
    localBinInPath = true;
    sessionVariables = {
      EDITOR = "nvim";
      CHROME_EXECUTABLE = "google-chrome-stable";
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland";
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      YDOTOOL_SOCKET = "/home/alex/.ydotool_socket";
      MOZ_ENABLE_WAYLAND = "1";
      RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
    };
  };
}
