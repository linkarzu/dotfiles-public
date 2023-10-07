# Symbolic links creation
After cloning the repo, I create a .vimrc symbolic link that points to my custom vimrc file
- Notice I'm creating the symlink in the `~` directory
- This will create the .vimrc file if it doesn't exist
- `-n` allows the link to be treated as a normal file if it is a symlink to a directory
- `-f` "force" overwrites without warning if it already exists 

# .vimrc file

```bash
ln -snf ~/github/dotfiles-public/vimrc ~/.vimrc
```

# .obsidian.vimrc file

```bash
rm ~/github/obsidian_main/.obsidian.vimrc
ln -s ~/github/dotfiles-public/vimrc ~/github/obsidian_main/.obsidian.vimrc
echo
echo
echo "Now restart obsidian"
```

# .zshrc file

```bash
ln -snf ~/github/dotfiles-public/zshrc ~/.zshrc
source ~/.zshrc
```

# .tmux.conf file

```bash
ln -snf ~/github/dotfiles-public/tmux.conf ~/.tmux.conf
source ~/.zshrc
```

