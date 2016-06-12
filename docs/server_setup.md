### Setting up an Ubuntu server on Digital Ocean

1. Add new user login

```
adduser bnjmn
cp -R .ssh /home/bnjmn/
chown -R bnjmn:bnjmn /home/bnjmn/.ssh
sudo EDITOR=vim visudo
# Add the following line to the end of the file
bnjmn ALL=(ALL) NOPASSWD:ALL
# or add the file `/etc/sudoers.d/bnjmn` with the same line

# [Install neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu)
# Install blahfiles
git clone https://github.com/bnjmn/blahfiles.git
# Install (n)vim plugins
# Check ssh works for bnjmn
# Remove root login via ssh, go to /etc/ssh/sshd_config
# Update PermitRootLogin (no) and PasswordAuthentication (no)
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

Static sites alongside but not inside Dokku
http://thepugautomatic.com/2016/01/static-sites-alongside-dokku-on-digital-ocean/

Dokku and ufw
https://github.com/jeffrafter/howto/blob/master/unformatted/dokku.md



#### New Domain

- Register it
- Assign DNS to Digital Ocean servers
- That's it. The rest can be handled from DO

- Setting up email, Was a b*tch

Have to add 2 MX records
2 TXT records for signing email
Alias (catchall) for domain in fastmail
* It would be nice if I could script this whole thing or switch to using
  Fastmail for DNS.


#### Primus config

- Add user bnjmn with sudo priv
- Add neovim ppa and install neovim
- install tree, love tree
  - python3-pip, python3-dev, cmake
- Clone blahfiles (https) and install
- pip3 install neovim
- Install (n)vim plugs minus YCM



