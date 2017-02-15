
Need to take a bunch more notes but just recording things I think I will forget right now.
This might make for a better blog post.

- Install homebrew
- Install a bunch of other stuff using brew
- Install a couple things via app store
- Adjust some settings on system prefs (review these)
- Update finder prefs and desktop view options (way to automate this?)
- Install blahfiles

#### IRC

Login with nick on freenode with
```
/msg NickServ IDENTIFY bnjmn password
```

### Firefox

Using different profiles.

Enable different add-ons on different machines/profiles.
Set this to true
https://wiki.mozilla.org/Services/Sync/Addon_Sync#Can_I_have_different_enabled_states_on_different_machines.3F

and then you should be able to enable or disable add-ons (like themes) without affecting other profiles.

Not sure this actually worked. Need to test with restart.


### Reboot

Install notes on January 23.

- Install Homebrew
```/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"```
- Install with `brew`
  - python python3 pyenv pyenv-virtualenv git bash-git-prompt tmux coreutils
- brew tap Caskroom/cask
- brew tap neovim/neovim && brew install neovim
  - iterm2 firefox(developer) google-chrome(canary)
- Create ssh key (TODO: doc this)

```
ssh-keygen -t rsa -b 4096 -C "email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub
```
- Add SSH key to gitub
- Clone blahfiles
- Install blahfiles
- Create github api token for homebrew
- Link iterm settings to directory in blahfiles (had to restart for these to take effect)


#### Python Pyenv setup

- Install system python (2 and 3) with brew
- Install pyenv and pyenv-virtualenv
- Install latest versions of python 2 and 3
- Create neovim virtualenvs for both 2 and 3


#### Issues

- git prompt (git_ps1)
- check for pyenv and pyenv-virtualenv
- nvm no such file or dir (fixed)
- gls not installed or checked before setting alias (installed coreutils)
- tmux doesn't work without installing reattach-user-namespace
