#!/usr/bin/env bash
# A simple, idempotent blahfiles install

# link options
ln_opts="-sfv"

# make symlinks
ln $ln_opts "`pwd`/bash/bashrc" "$HOME/.bashrc"
ln $ln_opts "`pwd`/bash/bash_profile" "$HOME/.bash_profile"
ln $ln_opts "`pwd`/zsh/zshrc" "$HOME/.zshrc"

ln $ln_opts "`pwd`/git/gitconfig" "$HOME/.gitconfig"
ln $ln_opts "`pwd`/git/gitignore_global" "$HOME/.gitignore_global"
ln $ln_opts "`pwd`/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"

# Independent vim config install
. vim/install.sh

# TMUX
ln $ln_opts "`pwd`/tmux/tmux.conf" "$HOME/.tmux.conf"
[ -d "$HOME/.tmux" ] || mkdir "$HOME/.tmux"
[ -d "$HOME/.tmux/plugins/tpm" ] || git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
