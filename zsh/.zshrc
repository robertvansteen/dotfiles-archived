# https://github.com/ohmyzsh/ohmyzsh/issues/6835
ZSH_DISABLE_COMPFIX=true

# Path to cloned dotfiles repo
export DOTFILES=$HOME/dotfiles

# Path to oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

HIST_STAMPS="dd/mm/yyyy"

ZSH_CUSTOM=$DOTFILES/zsh

source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle osx
antigen bundle git
antigen bundle laravel
antigen bundle yarn
antigen bundle command-not-found

antigen theme vercel/zsh-theme

antigen apply

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
