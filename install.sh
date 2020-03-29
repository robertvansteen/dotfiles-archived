source ./lib/echo.sh

bot "Hi! I'm going to install tooling and tweak your system settings."

# Ask for the administrator password upfront
bot "Just going to need your password to get started."
sudo -v

bot "All good, let's go!"

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
legit --install

# Remove quicklook libraries from quarantine
# https://github.com/sindresorhus/quick-look-plugins
xattr -d -r com.apple.quarantine ~/Library/QuickLook

# Make ZSH the default shell environment
sudo chsh -s $(which zsh)

# Install Composer
curl -sS https://getcomposer.org/installer | php
mv -f composer.phar /usr/local/bin/composer

# Install global Composer packages
rm ~/.composer/composer.lock && rm -r ~/.composer/vendor
/usr/local/bin/composer global require laravel/installer laravel/valet laravel/vapor-cli

# Install Laravel Valet
sudo $HOME/.composer/vendor/bin/valet install

# Install colorls
gem install colorls

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos

bot "All done, enjoy!"
