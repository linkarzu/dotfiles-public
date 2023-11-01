# Symbolic links creation

After cloning the repo, I create a .vimrc symbolic link that points to my custom vimrc file

- Commands below will create all the files if they don't yet exist, if they do exist, it will update them. 
- `-n` allows the link to be treated as a normal file if it is a symlink to a directory
- `-f` "force" overwrites without warning if it already exists

```bash
# Create the config dir in case doesnt exist
mkdir -p ~/.config

ln -snf ~/github/dotfiles-public/vimrc ~/.vimrc
ln -snf ~/github/dotfiles-public/vimrc ~/github/obsidian_main/.obsidian.vimrc
ln -snf ~/github/dotfiles-public/zshrc ~/.zshrc
ln -snf ~/github/dotfiles-public/tmux.conf ~/.tmux.conf
ln -snf ~/github/dotfiles-public/karabiner ~/.config/karabiner
ln -snf ~/github/dotfiles-public/nvim-lazyvim ~/.config/nvim
ln -snf ~/github/dotfiles-public/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -snf ~/github/dotfiles-public/yabai/yabairc ~/.yabairc
ln -snf ~/github/dotfiles-public/hammerspoon ~/.hammerspoon

# This is on the other repo where I keep my ssh config files
ln -snf ~/github/dotfiles/sshconfig-pers ~/.ssh/config

echo
echo "Restart obsidian"

source ~/.zshrc
```
