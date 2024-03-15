# Vars
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export GOPRIVATE=ghe.spotify.net/megaphone

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# PATH
export PATH="${PATH}:${HOME}/.krew/bin"
export PATH="${PATH}:/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# thefuck
eval $(thefuck --alias)

# pynev for managing versions of python
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Use vscode for kubectl
export KUBE_EDITOR='code --wait'

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# Something to do with homebrew?
source ~/.zprofile
# My secret keys
source ~/.secrets
# Prompt
source $(brew --prefix)/opt/spaceship/spaceship.zsh
# Plugins
source ~/.zsh_custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source ~/.zsh_custom/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

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

function f() {
    cd ${@:-./}
    cd $(find * -type d | fzf --preview 'tree -C -L 2 {}')
}

function prod() {
    gcloud config configurations activate prod
}

function stage() {
    gcloud config configurations activate stage
}

function xpn() {
    gcloud config configurations activate xpn
}

function lens() {
    open -a OpenLens
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

function cleanup() {
    osascript -e 'quit app "Google Chrome"'
    osascript -e 'quit app "OpenLens"'
    osascript -e 'quit app "Visual Studio Code"'
    osascript -e 'quit app "Reminders"'
    osascript -e 'quit app "Mail"'
    osascript -e 'quit app "Calendar"'
    osascript -e 'quit app "Notes"'
    osascript -e 'quit app "Finder"'
    osascript -e 'quit app "Terminal"'
}

function suggest() {
 gh copilot suggest $@
}

function explain() {
 gh copilot explain $@
}
