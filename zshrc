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

# macOS-specific configurations
if [ "$OS" = 'Mac' ]; then

    # This is for brew autocompletion, instructions ask to add it befor the general autocomplete settings
    if type brew &>/dev/null
    then
      FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    
      autoload -Uz compinit
      compinit
    fi

    # Initialize Starship, if it is installed
    if command -v starship &>/dev/null; then
        eval "$(starship init zsh)"
        export STARSHIP_CONFIG=$HOME/github/dotfiles-public/starship-config/starship.toml
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

        # # if zsh-history-substring-search is installed, source it so that the arrows are given back to it
        # if [ -f "$(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]; then
        #   zvm_after_init_commands+=('source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh')
        #   zvm_after_init_commands+=('bindkey "^[[A" history-substring-search-up')
        #   zvm_after_init_commands+=('bindkey "^[[B" history-substring-search-down')
        # fi
    fi

    # Initialize fzf if installed
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

    # Source zsh-autosuggestions if file exists
    if [ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
      source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    fi

    # # Source zsh-history-substring-search if file exists
    # # Also leaving this here in case fzf is not installed
    # if [ -f "$(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]; then
    #   source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    #   bindkey '^[[A' history-substring-search-up
    #   bindkey '^[[B' history-substring-search-down
    # fi

fi

# Linux (Debian)-specific configurations
if [ "$OS" = 'Linux' ]; then
    # Add Debian-specific configurations here
    # For example, you can add z.lua config for Linux here, assuming you've installed it.

    alias ls='ls --color=auto'
    alias nvim='~/nvim.appimage'

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
      export STARSHIP_CONFIG=$HOME/github/dotfiles-public/starship-config/$starship_file
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
        # leave blank space before the command
        echo
        neofetch
    fi

    # Initialize fzf if installed
    # It will automatically detect the directory in which the repo was downloaded
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

    # Initialize kubectl completion if kubectl is installed
    if command -v kubectl &>/dev/null; then
       source <(kubectl completion zsh)
    fi
fi

# Common settings and plugins
alias ll='ls -l'
alias python='python3'
alias lla='ls -al'
alias k='kubectl'

# Every time I log into a host I want to pull my github repos
cd ~/github/dotfiles-public && git pull > /dev/null 2>&1 || echo "Failed to pull dotfiles"

# Autocompletion settings
# https://github.com/Phantas0s/.dotfiles/blob/master/zsh/completion.zsh
zmodload zsh/complist
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files
# setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.
# Define completers
zstyle ':completion:*' completer _extensions _complete _approximate
# Use cache for commands using cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "~/.zcompcache"
# Complete the alias when _expand_alias is used as a function
zstyle ':completion:*' complete true
# Allow you to select in a menu
zstyle ':completion:*' menu select
# Autocomplete options for cd instead of directory stack
zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort modification
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
# zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# Colors for files and directory
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

