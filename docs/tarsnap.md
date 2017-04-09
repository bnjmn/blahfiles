# tarsnap

https://www.tarsnap.com/


## Install

`brew install tarsnap`


## Create a keyfile

```bash
$ tarsnap-keygen --keyfile tarsnap.key --user <tarsnap_email_login> --machine <machine_name>
```

The keyfile is very important. It is used to encrypt archives and authenticate
with tarsnap. Keep it secret. Keep it safe. With it, your data is controlled.
Without it, your data is lost.

## Relative/Absolute paths

I've decided to use a single backup directory and symlink files from here if
needed. Everything will be included underneath this directory that does not
match a pattern set in my tarsnaprc exclude.

It still seems best to archive things with an absoulte path using a command like this:

```bash
$ tarsnap -c -f "$(date +%Y-%m-%d_%H-%M)-$(uname -n)" -v ~/bckp/
```
