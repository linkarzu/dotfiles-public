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

