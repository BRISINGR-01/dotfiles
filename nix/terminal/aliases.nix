{
  ls = "ls --color=auto";
  ll = "ls -alF";
  la = "ls -A";
  l = "ls -CF";
  grep = "grep --color=auto";
  g = "grep --color=auto";
  gs = "git status";
  alert = ''notify-send --urgency=normal "Command has finished"'';
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
  gc = "nix-collect-garbage -d";

  deepseek = "ollama serve & ollama run deepseek-r1:1.5b";
}
