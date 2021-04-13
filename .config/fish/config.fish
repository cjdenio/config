# Fish config

function fish_greeting
  set text (random choice "Welcome to the terminal" "Hi there" "Wassup" "HIIIIIIII" "yo hi there" "yo it's $USER" "hello there")
  set cow (random choice "default" "vader" "turtle" "sheep")
  cowsay -f $cow $text | lolcat
end

# Functions
function fcd --wraps "fgh ls"
  if ! cd (fgh ls $argv) > /dev/null
    echo "Failed to find repository"; return 1
  end
end

if test $TERM = "xterm-kitty"
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
    abbr --add --global lg "ls | grep -i"
    abbr --add --global g "grep -i"

    abbr --add --global dcu docker-compose up -d
    abbr --add --global dcd docker-compose down
    abbr --add --global dcl docker-compose logs -f
    abbr --add --global dclm docker-compose logs -f main

    abbr --add --global dps docker ps

    abbr --add --global cl clear
    abbr --add --global nf neofetch
    abbr --add --global pg ping google.com -v
    
    abbr --add --global f fcd
end

alias gotchi-dokku="/usr/bin/env ssh dokku@52.33.253.206 -q -t -p 3022"

alias icat="kitty +kitten icat"

alias c="code ."
alias cx="code . && exit"

alias ls=exa
alias cat=bat

alias tree="exa -T"

# External tools
starship init fish | source

status --is-interactive; and source (rbenv init -|psub)

# Environment variables
set -x EDITOR nvim
