#!/usr/bin/env bash

ln -s `pwd`/bash/bashrc "$HOME/.bashrc"
ln -s `pwd`/bash/bash_profile "$HOME/.bash_profile"
ln -s `pwd`/gitconfig "$HOME/.gitconfig"
ln -s `pwd`/gitignore_global "$HOME/.gitignore_global"
ln -s `pwd`/tmux.conf "$HOME/.tmux.conf"

[ -e "$HOME/.vim" ] || ln -s `pwd`/vim "$HOME/.vim"
[ -e "$HOME/.config/nvim" ] || ln -s `pwd`/nvim "$HOME/.config/nvim"

# Plug - Pkg manager for (neo)vim
[ ! -f `pwd`/nvim/autoload/plug.vim ] && curl -fLo `pwd`/nvim/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
