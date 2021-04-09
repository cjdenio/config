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

# Aliases
alias gotchi-dokku="/usr/bin/env ssh dokku@52.33.253.206 -q -t -p 3022"

alias icat="kitty +kitten icat"

alias c="code ."
alias cx="code . && exit"

alias ls=exa
alias l=ls
alias cat=bat

alias tree="exa -T"

alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dclm="docker-compose logs -f main"
alias dcl="docker-compose logs -f"

alias dps="docker ps"

alias cl=clear

# External tools
starship init fish | source

status --is-interactive; and source (rbenv init -|psub)
