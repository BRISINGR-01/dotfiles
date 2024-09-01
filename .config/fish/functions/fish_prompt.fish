function fish_prompt
    set -l __last_command_exit_status $status

    if not set -q -g __fish_arrow_functions_defined
        set -g __fish_arrow_functions_defined
    end

    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l red (set_color -o red)
    set -l green (set_color -o green)
    set -l blue (set_color -o blue)
    set -l normal (set_color normal)

    set -l arrow_color "$green"
    if test $__last_command_exit_status != 0
        set arrow_color "$red"
    end

    set -l arrow "$arrow_color󰮺 "
    if fish_is_root_user
        set arrow "$arrow_color# "
    end

    set -l cwdp (string replace $HOME "~" (pwd))
    set -l cwd (string split -r -m2 -f2,3 / /$cwdp | string join "/")

    if not string length --quiet $cwd
      set cwd (string split -r -m2 -f1-2 / $cwdp | string join "/")
    end

    if not string length --quiet $cwd
      set cwd $cwdp
    end

    if not string match --quiet '/*' $cwd; and not string match --quiet '~*' $cwd  
      set cwd 󰇘/$cwd
    end

    set -l cwd "$green$cwd"
    echo -n -s ' ' $cwd ' ' $arrow $normal
end
