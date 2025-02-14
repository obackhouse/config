#!/bin/bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
mkdir -p $HOME/git
tar -C $HOME/git -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
echo 'export PATH=$PATH:$HOME/git/nvim-linux64/bin' >> ~/.profile
mkdir -p ~/.config/nvim
echo 'set runtimepath^=~/.vim runtimepath+=~/.vim/after' >> ~/.config/nvim/init.vim
echo 'let &packpath=&runtimepath' >> ~/.config/nvim/init.vim
echo 'source ~/.vimrc' >> ~/.config/nvim/init.vim
echo 'alias vi=nvim' >> ~/.profile
echo 'alias vim=nvim' >> ~/.profile
echo 'alias covi="vi --cmd '\''let copilot=1'\''"' >> ~/.profile
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
source ~/.profile
