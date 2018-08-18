#!/usr/bin/env bash

get_vim_dir () {
    # http://stackoverflow.com/a/246128
    local source="${BASH_SOURCE[1]}"
    while [ -h "$source" ]; do
        local dir="$( cd -P "$( dirname "$source" )" && pwd )"
        local source="$(readlink "$source")"
        [[ $source != /* ]] && source="$dir/$source"
    done
    local vim_dir="$( cd -P "$( dirname "$source" )" && pwd )"
    echo "$vim_dir"
}

vim_dir=$(get_vim_dir)


# Accept defaults from blahfiles/install.sh
if [ -z ${ln_opts+x} ]; then
    ln_opts="-sv";
#else
    #echo "ln_opts is set to '$ln_opts'";
fi


# Vim + Neovim Shared Configuration
# - Packages are installed into separate directories
# - When linking, if source is a directory use the `-n` option
# - see: https://superuser.com/a/645847/103893
[ -d "$HOME/.config" ] || mkdir "$HOME/.config"
ln -n $ln_opts "$vim_dir" "$HOME/.config/nvim"
ln -n $ln_opts "$vim_dir" "$HOME/.vim"


# Install PLUG for managing plugins
PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
PLUG_FILE="$HOME/.vim/autoload/plug.vim"
[ ! -f "$PLUG_FILE" ] && curl -fLo "$PLUG_FILE" --create-dirs "$PLUG_URL"
