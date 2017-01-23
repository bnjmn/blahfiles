Python Development on MacOS with Neovim
#######################################

Helpful notes on getting setup for Python development.

Installing Python
~~~~~~~~~~~~~~~~~

Install `python2` and `python3` with homebrew to use as the "`system`" Python
because the version that ships with the OS tends to be outdated.
```brew install python python3```

Use [Pyenv][pyenv] for **all** other Python needs.
```brew install pyenv```

Add `export PIP_REQUIRE_VIRTUALENV=true` to your shell run commands (bashrc) to
prevent packages from being install in any of the base python installations.

Add `.python-version` to `~/.gitignore_global`.

Create virtualenvs for neovim2 and neovim3

Install neovim-remote using pip


Python + Homebrew
~~~~~~~~~~~~~~~~~

- Install Python with homebrew (system)
- Install pyenv and pyenv-virtualenv with homebrew
- Activate any 

brew install pyenv-virtualenv



https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
https://github.com/yyuu/pyenv-virtualenv
https://amaral.northwestern.edu/blog/troubleshooting-pyenv

[pyenv]: https://github.com/yyuu/pyenv


Quick notes for JS
##################


Following along here:
https://www.gregjs.com/vim/2016/neovim-deoplete-jspc-ultisnips-and-tern-a-config-for-kickass-autocompletion/

Installed the following plugins

Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

And ran the npm install (might want to automate or modify this):

(inside dir)~/.config/nvim/plugged/tern_for_vim/
npm install

This didn't work very well
