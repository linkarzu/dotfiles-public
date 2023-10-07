# Filename: /Users/krishna/github/dotfiles-public/zshrc

# Detect OS
case "$(uname -s)" in
    Darwin)
        OS='Mac'
        ;;
    Linux)
        OS='Linux'
        ;;
    *)
        OS='Other'
        ;;
esac

# Common settings and plugins
alias ll='ls -l'
alias python='python3'
alias lla='ls -al'

# macOS-specific configurations
if [ "$OS" = 'Mac' ]; then

    # Initialize Starship, if it is installed
    if command -v starship &>/dev/null; then
        eval "$(starship init zsh)"
        export STARSHIP_CONFIG=$HOME/github/starship-config/starship.toml
    fi

    # Add MySQL client to PATH, if it exists
    if [ -d "/opt/homebrew/opt/mysql-client/bin" ]; then
        export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
    fi

    # Source Google Cloud SDK configurations, if Homebrew and the SDK are installed
    if command -v brew &>/dev/null; then
        if [ -f "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc" ]; then
            source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
        fi
        if [ -f "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc" ]; then
            source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
        fi
    fi

    # Use 'gls' as 'ls' if 'gls' is installed
    if command -v gls &>/dev/null; then
        alias ls='gls --color=auto'
    fi

    # Configure shell to point to z.lua, if Homebrew, lua and z.lua are installed
    if command -v brew &>/dev/null && command -v lua &>/dev/null; then
        if [ -f "$(brew --prefix z.lua)/share/z.lua/z.lua" ]; then
            eval "$(lua $(brew --prefix z.lua)/share/z.lua/z.lua --init zsh enhanced once)"
        fi
    fi

    # Source zsh-vi-mode plugin, if it exists
    if [ -f "/opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh" ]; then
        source /opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
        # Following 4 lines modify the escape key to `kj`
        ZVM_VI_ESCAPE_BINDKEY=kj
        ZVM_VI_INSERT_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
        ZVM_VI_VISUAL_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
        ZVM_VI_OPPEND_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
        # Source .fzf.zsh so that the ctrl+r bindkey is given back fzf
        zvm_after_init_commands+=('[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh')
    fi

    # Initialize fzf if installed
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi

# Linux (Debian)-specific configurations
if [ "$OS" = 'Linux' ]; then
    # Add Debian-specific configurations here
    # For example, you can add z.lua config for Linux here, assuming you've installed it.
    
    alias ls='ls --color=auto'

    # Initialize Starship, if it is installed
    if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
    # Extract the last digit of $HOST
    last_digit="${HOST: -1}"
    # Determine the Starship config file to use
    case $last_digit in
        1)
        starship_file="starship1.toml"
        ;;
        2)
        starship_file="starship2.toml"
        ;;
        3)
        starship_file="starship3.toml"
        ;;
        *)
        starship_file="starship4.toml"
        ;;
    esac
    # This is what applies the specific profile
    export STARSHIP_CONFIG=$HOME/github/starship-config/$starship_file
    fi

    # Initialize z.lua, if it is installed
    if command -v $HOME/github/z.lua/z.lua &>/dev/null; then
        eval "$(lua $HOME/github/z.lua/z.lua --init zsh enhanced once)"
    fi

    # Initialize zsh-vi-mode, if it is installed
    if [ -d "$HOME/github/zsh-vi-mode" ]; then
        source $HOME/github/zsh-vi-mode/zsh-vi-mode.plugin.zsh
        # This modifies the escape key
        ZVM_VI_ESCAPE_BINDKEY=kj
        ZVM_VI_INSERT_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
        ZVM_VI_VISUAL_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
        ZVM_VI_OPPEND_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
        # Source .fzf.zsh so that the ctrl+r bindkey is given back fzf
        zvm_after_init_commands+=('[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh')
    fi

    # Initialize neofetch, if it is installed
    if command -v neofetch &>/dev/null; then
        echo
        neofetch
    fi

    # Initialize fzf if installed
    # It will automatically detect the directory in which the repo was downloaded
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi
