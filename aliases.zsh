# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias c="cd ~/Code"
alias dot="cd $DOTFILES"
alias g="git"
alias h="history"
alias v="vim"
alias art="php artisan"
alias artisan="php artisan"
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reload="source $HOME/.zshrc"

# Applications 
alias preview="open -a '$PREVIEW'"
alias safari="open -a safari"
alias firefox="open -a firefox"
alias chrome="open -a google\ chrome"
alias f='open -a Finder'

# List all files colorized in long format
alias l="ls -l ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -la ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, yarn, and their installed packages
alias update="sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; brew upgrade yarn; yarn global upgrade";

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"