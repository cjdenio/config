# Fish config

# function fish_greeting
#   set text (random choice "Welcome to the terminal" "Hi there" "Wassup" "HIIIIIIII" "yo hi there" "yo it's $USER" "hello there")
#   set cow (random choice "default" "vader" "turtle" "sheep")
#   cowsay -f $cow $text | lolcat
# end

# Functions
function fish_command_not_found
    echo -n "🤔 "
    set_color -d
    echo -n "Command not found: "
    set_color normal
    set_color ff5555
    echo -n "$argv[1] "
    set_color bd93f9
    echo $argv[2..]
    set_color normal
end

function fcd --wraps "fgh ls"
    if ! cd (fgh ls $argv) >/dev/null
        echo "Failed to find repository"
        return 1
    end
end

if test $TERM = xterm-kitty
    function ssh
        kitty +kitten ssh $argv
    end
end

function mkcd
    mkdir $argv
    cd $argv
end

function kccdownload
    curl $argv[1] --output - | ffmpeg -i - -ab 48k $argv[2]
end

# Aliases/Abbreviations
if status --is-interactive
    abbr --add --global vi nvim
    abbr --add --global vim nvim

    abbr --add --global l ls
    abbr --add --global d ls
    abbr --add --global lg "ls | grep -i"
    abbr --add --global g "grep -i"

    abbr --add --global dcu docker compose up -d
    abbr --add --global dcd docker compose down
    abbr --add --global dcl docker compose logs -f
    abbr --add --global dclm docker compose logs -f main

    abbr --add --global dps docker ps
    abbr --add --global dpsa docker ps -a

    abbr --add --global cl clear
    abbr --add --global nf neofetch
    abbr --add --global pg ping google.com -v

    abbr --add --global f fcd

    abbr --add --global kube kubectl
end

alias icat="kitty +kitten icat"

alias c="code ."
alias cx="code . && exit"
alias o="open ."
alias ox="open . && exit"

alias ls=exa
alias cat=bat

alias tree="exa -T"

alias gcd="cd (git rev-parse --show-toplevel)"

alias 🐟="fish"
alias 💥="bash"
alias 💤="zsh"

# External tools
starship init fish | source

# Right prompt
function fish_right_prompt
    set_color green
    echo -n " ❮ "
    set_color -o yellow
    date "+%I:%M %p"
    set_color normal
end

status --is-interactive; and source (rbenv init -|psub)

# Environment variables
set -x EDITOR nvim
# set -x GPG_TTY (tty)

# test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# Keybindings
bind -M insert \cF accept-autosuggestion
bind -M insert \cP history-search-backward
bind -M insert \cN history-search-forward
bind q exit
