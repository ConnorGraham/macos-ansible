
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# setup_zsh_plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit && compinit

# Keybindings
bindkey '^[[B' history-search-backward
bindkey '^[[A' history-search-backward

# History
histsize=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
Histdup=erase
setopt appendhistory
setopt extendedhistory
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history
setopt hist_save_no_dups
setopt hist_find_no_dups

# Misc Vars
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi
## PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="${PATH}:${HOME}/.krew/bin"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
## Docker
export DOCKER_HOST="unix:///Users/cxg8655/.colima/docker.sock"
## Use vscode for kubectl
export KUBE_EDITOR='code --wait'
## NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# My secret keys
source ~/.secrets
# Prompt
#source $(brew --prefix)/opt/spaceship/spaceship.zsh

# Getting Fancy
eval $(zoxide init --cmd cd zsh) 
alias ls='eza --icons --group-directories-first'
## Fzf 
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --ansi --preview "bat --color=always --style=header,grid --line-range :500 {}"'
zstyle ':completion:*' menu no
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ''
zstyle ':fzf-tab:*' fzf-preview 'bat --color=always --style=header,grid --line-range :500 {}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
source <(fzf --zsh)

# Aliases
function k() {
    kubectl $@
}

function kc() {
    kubectx $@
}

function kn() {
    kubens $@
}

function config() {
    nvim ~/git/macos-ansible/roles/zsh/files/.zshrc
    ansible-playbook ~/git/macos-ansible/playbook.yml --tags "zsh"
    source ~/.zshrc
}

function wifi() {
  sudo ifconfig en0 down
  sudo ifconfig en0 up
}

function suggest() {
 gh copilot suggest $@
}

function explain() {
 gh copilot explain $@
}

function mr() {
 glab mr create --fill --squash-before-merge
 glab mr view -w
}

source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
