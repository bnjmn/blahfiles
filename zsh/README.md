zsh
===

Getting started, using [oh my zsh][omz-github]

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Installed `zsh` with brew just to upgrade it and added zsh-completions.

```bash
brew install zsh zsh-completions
```

also installed plugins

- (brew) https://github.com/zsh-users/zsh-autosuggestions
- (brew) https://github.com/zsh-users/zsh-syntax-highlighting
  - brew install zsh-syntax-highlighting

Had to run `chmod go-w '/usr/local/share'` after starting zsh
for zsh-completions.



[omz-github]: https://github.com/robbyrussell/oh-my-zsh

--- 

## Next

Maybe check out [Prezto][prezto] as an oh-my-zsh replacement.

[prezto]: https://github.com/sorin-ionescu/prezto
