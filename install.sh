#!/usr/bin/env bash
# A simple, idempotent blahfiles install

blah_dir="$(cd "$(dirname "$0")" || return; pwd -P)"

# link options
ln_opts="-sfv"

# make symlinks
ln $ln_opts "$blah_dir/bash/bashrc" "$HOME/.bashrc"
ln $ln_opts "$blah_dir/bash/bash_profile" "$HOME/.bash_profile"
ln $ln_opts "$blah_dir/zsh/zshrc" "$HOME/.zshrc"

ln $ln_opts "$blah_dir/git/gitconfig" "$HOME/.gitconfig"
ln $ln_opts "$blah_dir/git/gitignore_global" "$HOME/.gitignore_global"
ln $ln_opts "$blah_dir/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"

# symlink asimov to automatically load it on login
asimov_plist="com.stevegrunwell.asimov.plist"
ln $ln_opts "$blah_dir/asimov/$asimov_plist" "$HOME/Library/LaunchAgents/$asimov_plist"

# Independent vim config install
. vim/install.sh

# TMUX
ln $ln_opts "$blah_dir/tmux/tmux.conf" "$HOME/.tmux.conf"
[ -d "$HOME/.tmux" ] || mkdir "$HOME/.tmux"
[ -d "$HOME/.tmux/plugins/tpm" ] || git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
