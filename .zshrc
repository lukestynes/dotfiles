# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# MacOS make sure homebrew in path
eval "$(/opt/homebrew/bin/brew shellenv)"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source / Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Install Powerlevel10k
zinit ice depth1; zinit light romkatv/powerlevel10k

# Insall ZSH plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::python
# zinit snippet OMZP::tmux
zinit snippet OMZP::command-not-found

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load scripts
PATH="$PATH":"$HOME/.local/scripts/"

# Keybindings
bindkey '^[[A' history-search-backward # Up arrow
bindkey '^[[B' history-search-forward # Down arrow
bindkey -s ^f "tmux-sessionizer\n"


# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Alases
alias ls='ls --color'
alias ll='ls -la --color'
alias c='clear'
alias br='./gradlew bootRun' # Run gradlew project for SENG
alias gt='./gradlew test' # Run gradle tests for SENG

# Run dual Nvim configurations
alias nv='nvim' # default Nvim (lazynvim)
alias nk='NVIM_APPNAME=nvim-kickstart nvim' # Kickstart Nvim
alias nvl='NVIM_APPNAME=nvim-lazyvim nvim' # Clean lazyvim
alias nvc='NVIM_APPNAME=nvchad nvim'

# Shell integrations
eval "$(fzf --zsh)"

# Default editor
export EDITOR="nvim"


# Java
# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"

# Configs specific for UC
source ~/.uc-specific
# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"
# eval "$(jenv init -)"
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# bun completions
[ -s "/Users/lukes/.bun/_bun" ] && source "/Users/lukes/.bun/_bun"

eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/Users/lukes/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/lukes/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# Added by Antigravity
export PATH="/Users/lukes/.antigravity/antigravity/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
