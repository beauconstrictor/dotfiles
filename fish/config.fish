if status is-interactive
    set -U fish_greeting
end

abbr -a vi nvim
abbr -a ls ls -lah
abbr -a tilde ssh beauconstrictor@tilde.team
abbr -a p passwords.sh
abbr -a p passwords.sh
abbr -a amend git commit --amend
abbr -a log git log --oneline --graph
abbr -a o xdg-open
abbr -a tc trash-clear

function mail
  thunderbird > /dev/null 2>&1 &
end

function trash-clear
  rm -rf ~/.local/share/Trash/files/*
  rm -rf ~/.local/share/Trash/info/*
end

function commit
  git add .
  git commit
end

function fish_prompt
    echo ""
    set left (set_color brblack)beau(set_color normal)@fedora" "(set_color brblack)(prompt_pwd)(set_color normal)
    # set left "beau@fedora ~"

    set right [(date "+%H:%M:%S")]" "

    set width (tput cols)
    set left_len (string length --visible $left)
    set right_len (string length $right)

    set pad (math $width - $left_len - $right_len)

    if test $pad -lt 1
        set pad 1
    end

    printf "%s%*s%s\n" $left $pad "" $right

    printf (set_color normal)"> "(set_color green)"\$ "(set_color normal)
end

function fish_mode_prompt
end

set PATH ~/.local/bin $PATH
set PATH ~/bin $PATH
set PATH ~/.nimble/bin $PATH

set -gx PASSWORDS ~/documents/passwords.yaml.gpg
set -gx EDITOR nvim

set -gx FS128_TOOL ~/projects/ozpex/micro/osm/src/fs128-tool.py
set -gx OSM_IMG ~/projects/ozpex/micro/osm/build/osm.bin
set -gx OSM_LIB ~/projects/ozpex/micro/osm/src/lib/

set -gx MADLAD_INSTALL ~/.local/share/madlad

fish_vi_key_bindings
fish_vi_cursor
