# Vars
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# PATH
export PATH="${PATH}:${HOME}/.krew/bin"
export PATH="${PATH}:/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin"
export PATH=$HOME/bin:/usr/local/bin:$PATH

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

function jira() {
    open -u "https://megaphone.atlassian.net/jira/software/c/projects/MEG/boards/43?assignee=6317612362fe1e6eac6d8074"
}

function gcp() {
    open -u "https://console.cloud.google.com/"
}

function ghe() {
    open -u "https://ghe.spotify.net/megaphone?q=${@}"
}

function drive() {
    open -u "https://drive.google.com/"
}

function r() {
    reminders $@
}

function grafana() {
    open -u "https://grafana.gke.megaphone.cloud/d/nginx/nginx-ingress-controller"
}

function logs() {
    open -u "https://console.cloud.google.com/logs/query"
}

function nconf() {
    kubectl exec svc/ingress-nginx-controller -n ingress-nginx -- cat nginx.conf
}

function shit() {
    grafana
    logs
}

function cat() {
    bat $@
}

function lens() {
    open -a OpenLens
}

function config() {
    nvim ~/git/macos-ansible/roles/zsh/files/.zshrc
    ansible-playbook ~/git/macos-ansible/playbook.yml --tags "zsh"
    source ~/.zshrc
}

function cleanup() {
    osascript -e 'quit app "Google Chrome"'
    osascript -e 'quit app "OpenLens"'
    osascript -e 'quit app "Visual Studio Code"'

}
