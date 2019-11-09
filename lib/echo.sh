# Author: Adam Eivy
# https://github.com/atomantic/dotfiles/blob/master/lib_sh/echos.sh

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

function line() {
  echo "\n"
}

function ok() {
    echo "$COL_GREEN[ok]$COL_RESET "$1
}

function bot() {
    echo "$COL_GREEN\[._.]/$COL_RESET - "$1
}

function running() {
    echo "$COL_YELLOW ⇒ $COL_RESET"$1": "
}

function action() {
    echo "$COL_YELLOW[action]:$COL_RESET\n ⇒ $1..."
}

function warn() {
    echo "$COL_YELLOW[warning]$COL_RESET "$1
}

function error() {
    echo "$COL_RED[error]$COL_RESET "$1
}