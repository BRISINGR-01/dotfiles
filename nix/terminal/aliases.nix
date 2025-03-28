let
  eza = "eza --icons=always --git-ignore";
  ezaList = "${eza} -l -M --no-user --no-time";
in {
  l = eza;
  ll = ezaList;
  lla = "eza --icons=always -a -l -M --no-user --no-time";
  la = "eza --icons=always -a";
  lr = "${eza} -T -L=3";
  lsf = "${eza} -f --show-symlinks";
  lsd = "${eza} -D --show-symlinks";
  lls = "${ezaList} --total-size";

  grep = "grep --color=auto";
  g = "grep --color=auto";
  gs = "git status";
  gc = "git add --all; git commit -m";
  alert = ''notify-send --urgency=normal "Command has finished"'';
  n = ''notify-send --urgency=normal "Command has finished"'';
  cls = "clear";
  coder = "code -r";
  yt = "yt-dlp -x --audio-format mp3 -P ~/Desktop/Alex/Music/";
  opent = "ghostty";
  f = "fuck";
  r = "rm -i";
  rr = "rm -ir";
  mocp = "mocp -T nightly_theme";
  fzf-clip = "cliphist list | fzf --no-sort | cliphist decode";

  snvim = "sudo -E -s nvim";
  nvchad = "exec env NVIM_APPNAME=nvim.nvchad nvim";
  nvlazy = "exec env NVIM_APPNAME=nvim.lazy nvim";

  hist = "tv fish-history";
  fenv = "tv env";

  rnix = "nixos-rebuild switch";
  hms = "home-manager switch";
  srnix = "sudo nixos-rebuild switch";
  temp = "nix-shell --command fish -p";
  nix-shell = "nix-shell --command fish";
  ngc = "nix-collect-garbage -d";

  deepseek = "ollama serve & ollama run deepseek-r1:1.5b";
}
