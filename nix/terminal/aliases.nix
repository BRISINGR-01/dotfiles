let
  eza = "eza --icons=always --git-ignore";
  ezaList = "${eza} -l -M --no-user --no-time";
in {
  h = "Hyprland";
  l = eza;
  ll = ezaList;
  lla = "eza --icons=always -a -l -M --no-user --no-time";
  la = "eza --icons=always -a";
  lr = "${eza} -T -L=3";
  lsf = "${eza} -f --show-symlinks -a";
  lsd = "${eza} -D --show-symlinks";
  lls = "${ezaList} --total-size";

  c = "wl-copy";
  pwdc = "pwd | wl-copy";
  pc = "utils path-copy";

  grep = "grep --color=auto";
  g = "grep --color=auto";

  gs = "git status";
  gc = "git add --all; git commit -m";
  gp = "git pull";

  alert = ''notify-send -e --urgency=normal "Command has finished"'';
  n = ''notify-send -e --urgency=normal "Command has finished"'';

  cls = "clear";
  coder = "code -r";

  yt = "yt-dlp -x --audio-format mp3 -P ~/Desktop/Alex/Music/";
  f = "fuck";
  r = "trash-put";
  rr = "rm -ir";
  mocp = "mocp -T nightly_theme";
  i = "~/dotfiles/scripts/install";

  snvim = "sudo -E -s nvim";
  nvchad = "exec env NVIM_APPNAME=nvim.nvchad nvim";
  nvlazy = "exec env NVIM_APPNAME=nvim.lazy nvim";

  envn = "set tmp (env | grep (tv env) | cut -d '=' -f1);commandline $tmp";
  envv = "set tmp (env | grep (tv env) | cut -d '=' -f2-);commandline $tmp";
  pathf = "echo $PATH | tr ' ' '\\n' | tv";

  rnix = "nixos-rebuild switch";
  hms = "home-manager switch";
  srnix = "sudo nixos-rebuild switch; notify-send -e 'NixOS rebuilt'";
  temp = "nix-shell --command fish -p";
  nix-shell = "nix-shell --command fish";
  ngc = "nix-collect-garbage -d";

  deepseek = "ollama serve & ollama run deepseek-r1:1.5b";
  "+x" = "chmod +x";
  t =
    "set tmp = (tmux capture-pane -S -1000 && tmux show-buffer | sed -e '/❯ */d' -e '/^t$/d' -e '/^$/d' -e '/^ ~ 󰮺$/d') | vipe; commandline $tmp";
  trash-tui =
    "~/Desktop/VSC/trash-tui/target/x86_64-unknown-linux-gnu/debug/trash-tui";
}
