export PATH="$PATH:$HOME/dotfiles/scripts/:$HOME/.local/bin"

export EDITOR="nvim";
export CHROME_EXECUTABLE="google-chrome-stable";
export QT_QPA_PLATFORM="wayland";
export ELECTRON_OZONE_PLATFORM_HINT="wayland";
export MOZ_ENABLE_WAYLAND="1";
export GTK_THEME="Adwaita-dark";
export FZF_DEFAULT_OPTS="\
--color=fg:#d0d0d0,fg+:#d0d0d0,bg+:#2c323c \
--color=hl:#81A2BE,hl+:#5fd7ff,info:#81A2BE,marker:#81A2BE \
--color=prompt:#81A2BE,spinner:#81A2BE,pointer:#81A2BE,header:#72b8c7 \
--color=border:#81A2BE,label:#aeaeae,query:#d9d9d9 \
--border=rounded \
--preview-window=border-rounded \
--pointer='' \
--layout=reverse \
--info=inline \
# --tmux=60%,80% \
--preview 'cat {}'"

source /home/alex/config/aliases.sh

fish && exit
