# Symbolic links creation
After cloning the repo, I create a .vimrc symbolic link that points to my custom vimrc file
- Commands below will create all the files if they don't yet exist, if they do exist, it will update them. 
- `-n` allows the link to be treated as a normal file if it is a symlink to a directory
- `-f` "force" overwrites without warning if it already exists

```bash
ln -snf ~/github/dotfiles-public/vimrc ~/.vimrc
ln -snf ~/github/dotfiles-public/vimrc ~/github/obsidian_main/.obsidian.vimrc
ln -snf ~/github/dotfiles-public/zshrc ~/.zshrc
ln -snf ~/github/dotfiles-public/tmux.conf ~/.tmux.conf
ln -snf ~/github/dotfiles-public/karabiner ~/.config/karabiner
ln -snf ~/github/dotfiles-public/nvim-lazyvim ~/.config/nvim
ln -snf ~/github/dotfiles-public/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -snf ~/github/dotfiles-public/yabai/yabairc ~/.yabairc

echo
echo "Restart obsidian"

source ~/.zshrc
```

