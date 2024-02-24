# Contents

<!-- toc -->

- [Youtube video explaining my dotfiles and how to clone them](#youtube-video-explaining-my-dotfiles-and-how-to-clone-them)
- [Repo overview](#repo-overview)
- [Update symbolic links](#update-symbolic-links)
  - [Point your zshrc file to the desired repo](#point-your-zshrc-file-to-the-desired-repo)

<!-- tocstop -->

## Youtube video explaining my dotfiles and how to clone them

<div align="center">
    <a href="https://youtu.be/XBjfzySpGdE">
        <img src="https://res.cloudinary.com/daqwsgmx6/image/upload/v1706358848/youtube/2024-macos-workflow/04-dotfiles-playback" alt="04 - What are dotfiles and how to clone them" width="600"/>
    </a>
</div>

## Repo overview

- This repo is related to my my youtube `2024 macOS workflow` video series
- `https://youtube.com/playlist?list=PLZWMav2s1MZTanWwNKYvS8qgwl0HBH9J-&si=q6ByPmN8I7SOBKmX`
- My dotfiles tend to change a lot, so I won't be modifying this current
  `dotfiles-public` repo anymore. That way, this repo always shows what's
  reflected in the youtube videos
- Repo where I keep my latest dotfiles, but will NOT match what's on youtube
  - `https://github.com/linkarzu/dotfiles-latest`

## Update symbolic links

- Commands below will create the files if they don't yet exist, if they do
  exist, it will update them.
- `-n` allows the link to be treated as a normal file if it is a symlink to a
  directory
- `-f` "force" overwrites without warning if it already exists

### Point your zshrc file to the desired repo

```bash
ln -snf ~/github/dotfiles-public/zshrc/zshrc-file.sh ~/.zshrc >/dev/null 2>&1
source ~/.zshrc
```

```bash
ln -snf ~/github/dotfiles-latest/zshrc/zshrc-file.sh ~/.zshrc >/dev/null 2>&1
source ~/.zshrc
```

```bash
# This is on the other repo where I keep my ssh config files
ln -snf ~/github/dotfiles/sshconfig-pers ~/.ssh/config >/dev/null 2>&1
```
