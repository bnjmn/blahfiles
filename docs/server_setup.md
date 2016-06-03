### Setting up an Ubuntu server on Digital Ocean

1. Add new user login

```
adduser bnjmn
cp -R .ssh /home/bnjmn/
chown bnjmn:bnjmn /home/bnjmn/.ssh
sudo EDITOR=vim visudo
# Add the following line to the end of the file
bnjmn ALL=(ALL) NOPASSWD:ALL
# Install blahfiles
git clone https://github.com/bnjmn/blahfiles.git
# [Install neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu)
# Check ssh works for bnjmn
# Remove root login via ssh
```

2. Install software (apt-get)


3. Add `ufw` firewall
4. Remove root login


https://www.exratione.com/2013/06/a-few-notes-on-migrating-an-ubuntu-instance-from-aws-to-digital-ocean/


#### Installing / Setting up [Dokku](https://github.com/dokku/dokku)


```
wget https://raw.githubusercontent.com/dokku/dokku/v0.5.7/bootstrap.sh
sudo DOKKU_TAG=v0.5.7 bash bootstrap.sh
```

Took a little while but it seems to work, even though no stated support for Ubuntu 16.

There was a quick setup that needed to happen by visiting the ip (a little weird).

Then try a demo app.

Issue with `sigil`, run:
https://github.com/dokku/dokku/issues/2034

```
sudo apt-get install sigil -t trusty --reinstall
```
