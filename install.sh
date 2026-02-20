#!/bin/bash

# 1. Install Vundle if it doesn't exist
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    echo "Installing Vundle..."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# 2. Copy .vimrc from repo folder to home directory
cp vim-config/.vimrc ~/.vimrc
echo ".vimrc copied to home directory."

# 3. Install vim setup per .vimrc contents
vim +PluginInstall +qall
echo "Vim setup complete with plugins!"
