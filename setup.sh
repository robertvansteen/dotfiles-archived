source ./lib/echo.sh

bot "Hi! I'm going to install tooling and tweak your system settings."

# Ask for the administrator password upfront
bot "Just going to need your password to get started."
# Keep-alive: update existing `sudo` timestamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
line

# Make sure macOS is fully up to date before doing anything
bot "Let's see if we need to run any updates for your system."
sudo softwareupdate --install --all

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Install legit aliases
# https://frostming.github.io/legit/
echo 'y' | legit --install

# Remove quicklook libraries from quarantine
# https://github.com/sindresorhus/quick-look-plugins
xattr -d -r com.apple.quarantine ~/Library/QuickLook

# Make ZSH the default shell environment
sudo chsh -s $(which zsh)

# Install Composer
curl -sS https://getcomposer.org/installer | php
mv -f composer.phar /usr/local/bin/composer

# Install global Composer packages
rm $HOME/.composer/composer.lock && rm -r $HOME/.composer/vendor
/usr/local/bin/composer global require laravel/installer laravel/valet laravel/vapor-cli

# Install Laravel Valet
sudo $HOME/.composer/vendor/bin/valet install

# Install colorls
gem install colorls

# Install zsh-syntax-highlighting
sudo rm -r $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Install zsh autosuggestions
sudo rm -r $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Install zsh you-should-use
sudo rm -r $HOME/.oh-my-zsh/custom/plugins/you-should-use
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $HOME/.oh-my-zsh/custom/plugins/you-should-use

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc

# Set up git config
rm -f $HOME/.gitconfig
rm -f $HOME/.gitignore_global
ln -s $HOME/dotfiles/git/.gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/git/.gitignore_global $HOME/.gitignore_global

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos

bot "All done, enjoy!"
