# Symbolic links creation

After cloning the repo, I create a .vimrc symbolic link that points to my custom vimrc file

- Commands below will create all the files if they don't yet exist, if they do exist, it will update them.
- `-n` allows the link to be treated as a normal file if it is a symlink to a directory
- `-f` "force" overwrites without warning if it already exists

```bash
# Create the config dir in case doesnt exist, this dir holds nvim, neofetch, alacritty configs
# If the dir/file that the symlink points to doesnt exist, it will error out, so I direct them to dev null
mkdir -p ~/.config
ln -snf ~/github/dotfiles-public/vimrc ~/.vimrc >/dev/null 2>&1
ln -snf ~/github/dotfiles-public/vimrc ~/github/obsidian_main/.obsidian.vimrc >/dev/null 2>&1
ln -snf ~/github/dotfiles-public/zshrc ~/.zshrc >/dev/null 2>&1
ln -snf ~/github/dotfiles-public/tmux.conf ~/.tmux.conf >/dev/null 2>&1
ln -snf ~/github/dotfiles-public/karabiner ~/.config/karabiner >/dev/null 2>&1
ln -snf ~/github/dotfiles-public/nvim-lazyvim ~/.config/nvim >/dev/null 2>&1
ln -snf ~/github/dotfiles-public/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml >/dev/null 2>&1
ln -snf ~/github/dotfiles-public/yabai/yabairc ~/.yabairc >/dev/null 2>&1
ln -snf ~/github/dotfiles-public/hammerspoon ~/.hammerspoon >/dev/null 2>&1
# This is on the other repo where I keep my ssh config files
ln -snf ~/github/dotfiles/sshconfig-pers ~/.ssh/config >/dev/null 2>&1

echo
echo "Restart obsidian"

source ~/.zshrc
```
