# .vimrc file
After cloning the repo, I create a .vimrc symbolic link that points to my custom vimrc file
- Notice I'm creating the symlink in the `~` directory
- This will create the .vimrc file if it doesn't exist

```bash
ln -s ~/github/dotfiles-public/vimrc ~/.vimrc
```

## .obsidian.vimrc file
This below command is for my obsidian repo
```bash
rm ~/github/obsidian_main/.obsidian.vimrc
ln -s ~/github/dotfiles-public/vimrc ~/github/obsidian_main/.obsidian.vimrc
echo
echo
echo "Now restart obsidian"
```

```bash
carzu@carzu-MBP~
$ ln -s ~/github/dotfiles-public/vimrc ~/.vimrc

carzu@carzu-MBP~
$ ls -al | grep .vim
drwxr-xr-x    3 carzu staff      96 Jun 10 18:43 .vim
-rw-------    1 carzu staff   22493 Jul 13 21:59 .viminfo
lrwxr-xr-x    1 carzu staff      34 Jul 13 22:06 .vimrc -> /Users/carzu/github/dotfiles-public/vimrc
```

# .zshrc file
Create the symlink, I'm deleting the file before, in case it already exists 

Don't use the '.' on the $fileToReplace below
```bash
fileToReplace=zshrc
rm ~/'.'$fileToReplace
ln -s ~/github/dotfiles-public/$fileToReplace ~/'.'$fileToReplace
source ~/.zshrc
```

# .tmux.conf file
Create the symlink, I'm deleting the file before, in case it already exists 

Don't use the '.' on the $fileToReplace below
```bash
fileToReplace=tmux.conf
rm ~/'.'$fileToReplace
ln -s ~/github/dotfiles-public/$fileToReplace ~/'.'$fileToReplace
source ~/.zshrc
```


# sshconfig file
After cloning the repo, first make sure that the permissions are set correctly on the sshconfig file. SSH needs that this file is only readable and writable by the user

```bash
chmod 600 ~/github/dotfiles/sshconfig-pers
chmod 600 ~/github/dotfiles/sshconfig-other
```

Then create the symlink, make sure the .ssh directory exists first and has the correct permissions
```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
rm ~/.ssh/config
ln -s ~/github/dotfiles/sshconfig-pers ~/.ssh/config
```

## Identity files
Do not leave all your identity files at the top of the file, because there are servers that will block the connection if multiples files are tried against them.

I was having issues with some freeIPA servers, they were denying the connection because I had 6 identity files at the very top of the `config` file.

Once I removed those and instead specified them in a host per host basis, the issue was solved.

## SSH to devices
When you SSH to devices, use the `Host` name that is configured in the `config` file, for example
```bash
ssh debian-xcp1
```

If instead of using the hostname you use the IP, it will connect to the IP directly and never consult the `config` file, for example
```bash
ssh krishna@192.168.88.2
```

## Configure iTerm
In your iTerm profiles make sure you also configure the ssh command as `ssh debian-xcp1` instead of using the IP
