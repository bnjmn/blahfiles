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

It is recommended that you use absolute paths when creating archives. This ensures
that regardless of where tarsnap is run your archives will be structured in
a similar way. When creating the archive the root slash (/) is actually removed.
Extracting files from that archive will use the full path relative to the
current directory.



I've decided to use a single backup directory and symlink files from here if
needed. Everything will be included underneath this directory that does not
match a pattern set in my tarsnaprc exclude.

It still seems best to archive things with an absoulte path using a command like this:

```bash
$ tarsnap -c -f "$(date +%Y-%m-%d_%H-%M)-$(uname -n)" -v ~/back/this/up/
```

## Sync on multiple machines

- On new machine.
- Have the same config.
- Use the same key.
- Run `tarsnap --fsck` to sync the cache.
- List archives `tarsnap --list-archives | sort`
- Extract the archive `tarsnap -x -v -f 2017-04-09_12-34-machine.local`
  - This should create a new directory with the full paths for each file `./Users/name/...`
- rsync the extracted archive to the backup directory on the new machine.

```bash
$ rsync -avhu --progress Path/to/extract/backup/ ~/backup/
$ rm -rf Path/to/extract
```

## Extracting a subdirectory

`tarsnap -xv -f 2017-04-09_12-34-machine.local Users/*/backup/subdirectory`
