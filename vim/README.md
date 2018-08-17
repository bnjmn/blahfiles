vim + neovim config
===================


I've set things up so that `vim` and `neovim` should safely share the same
configuration files.

- Plugins are installed in separate directories for each
- neovim specific stuff is put in `if has('nvim')`
- vim specific stuff is put in `if !has('nvim')`


Install plugins quickly from the command line with:

```bash
$ vim +PlugInstall +close2
$ nvim +PlugInstall +close2
```
