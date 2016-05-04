#!/usr/bin/env bash

ln -s `pwd`/bash/bashrc "$HOME/.bashrc"
ln -s `pwd`/bash/bash_profile "$HOME/.bash_profile"
ln -s `pwd`/gitconfig "$HOME/.gitconfig"
ln -s `pwd`/gitignore_global "$HOME/.gitignore_global"
ln -s `pwd`/tmux.conf "$HOME/.tmux.conf"

[ -e "$HOME/.vim" ] || ln -s `pwd`/vim "$HOME/.vim"
[ -d "$HOME/.config" ] || mkdir "$HOME/.config"
[ -e "$HOME/.config/nvim" ] || ln -s `pwd`/nvim "$HOME/.config/nvim"


# Install Plug for managing neovim and vim packages
PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

# Neovim
[ ! -f `pwd`/nvim/autoload/plug.vim ] && curl -fLo `pwd`/nvim/autoload/plug.vim "$PLUG_URL"

# Vim
[ ! -f `pwd`/vim/autoload/plug.vim ] && curl -fLo `pwd`/vim/autoload/plug.vim "$PLUG_URL"
