#!/usr/bin/env bash

ln -s `pwd`/bash/bashrc "$HOME/.bashrc"
ln -s `pwd`/bash/bash_profile "$HOME/.bash_profile"
ln -s `pwd`/gitconfig "$HOME/.gitconfig"
ln -s `pwd`/gitignore_global "$HOME/.gitignore_global"

[ -d "$HOME/.config" ] || mkdir "$HOME/.config"
[ -e "$HOME/.config/nvim" ] || ln -s `pwd`/nvim "$HOME/.config/nvim"
[ -e "$HOME/.vim" ] || ln -s `pwd`/nvim "$HOME/.vim"

# Install Plug for managing (neo)vim packages
PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
[ ! -f `pwd`/nvim/autoload/plug.vim ] && curl -fLo `pwd`/nvim/autoload/plug.vim --create-dirs "$PLUG_URL"
[ ! -f `pwd`/vim/autoload/plug.vim ] && curl -fLo `pwd`/vim/autoload/plug.vim --create-dirs "$PLUG_URL"

# TMUX
ln -s `pwd`/tmux/tmux.conf "$HOME/.tmux.conf"
[ -d "$HOME/.tmux" ] || mkdir "$HOME/.tmux"
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
