#!/bin/bash

echo "installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "install vim plug for installing vim plugins"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "installing homebrew packages"
brew install --file ./Brewfile

# install tmux plugins
echo "installing tmux plugins..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "copying config files..."
mkdir -p ~/.config
cp ./alacritty.yml ~/.config/alacritty.yml
cp ./color.yml ~/.config/color.yml
cp .tmux.conf ~/.tmux.conf
cp -R .hammerspoon/ ~/.hammerspoon
cp .irbrc ~/.irbrc

echo '[ -f $HOMEBREW_PREFIX/etc/profile.d/autojump.sh ] && . $HOMEBREW_PREFIX/etc/profile.d/autojump.sh' >> ~/.zshrc

echo "your environment is now setup..."

echo "restarting zsh"
exec zsh
