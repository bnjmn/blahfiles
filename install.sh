#!/usr/bin/env bash
# A simple, idempotent blahfiles install

ln_opts="-sfv"

# make symlns (verbose), prompt if target exists
ln $ln_opts `pwd`/bash/bashrc "$HOME/.bashrc"
ln $ln_opts `pwd`/bash/bash_profile "$HOME/.bash_profile"
ln $ln_opts `pwd`/git/gitconfig "$HOME/.gitconfig"
ln $ln_opts `pwd`/git/gitignore_global "$HOME/.gitignore_global"

. vim/install.sh
# Vim + Neovim Shared Configuration
# - Packages are installed into separate directories
#[ -d "$HOME/.config" ] || mkdir "$HOME/.config"
#ln $ln_opts `pwd`/vim "$HOME/.config/nvim"
#ln $ln_opts `pwd`/vim "$HOME/.vim"

### Install Plug seperately for Neovim and Vim for managing (neo)vim packages
#PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
#PLUG_FILE="$HOME/.vim/autoload/plug.vim"

## Vim and Neovim share configuration and plug install 
#[ ! -f "$PLUG_FILE" ] && curl -fLo "$PLUG_FILE" --create-dirs "$PLUG_URL"
## vim +PlugInstall +close2

# TMUX
ln $ln_opts "`pwd`/tmux/tmux.conf" "$HOME/.tmux.conf"
[ -d "$HOME/.tmux" ] || mkdir "$HOME/.tmux"
[ -d "$HOME/.tmux/plugins/tpm" ] || git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
