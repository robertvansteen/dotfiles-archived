# https://github.com/ohmyzsh/ohmyzsh/issues/6835
ZSH_DISABLE_COMPFIX=true

# Path to cloned dotfiles repo
export DOTFILES=$HOME/dotfiles

# Path to oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Minimal - Theme Settings
export MNML_INSERT_CHAR="$"
export MNML_PROMPT=(mnml_git mnml_keymap)
export MNML_RPROMPT=('mnml_cwd 20')

ZSH_THEME="minimal"

HIST_STAMPS="dd/mm/yyyy"

ZSH_CUSTOM=$DOTFILES/zsh

plugins=(git composer node npm github zsh-autosuggestions zsh-syntax-highlighting)

# Load all the things.
source $ZSH/oh-my-zsh.sh

# Fix slow paste problem w/ zsh-syntax-highlighting plugin
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/295
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# Set up tab complete for colorls
# See: https://github.com/athityakumar/colorls#installation
source $(dirname $(gem which colorls))/tab_complete.sh
