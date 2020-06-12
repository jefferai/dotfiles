# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$HOME/src/go/bin:$PATH

export VAULT_ADDR="http://127.0.0.1:8200"

export GPG_TTY=$(tty)

alias gov="cd ~/go/src/github.com/hashicorp/vault"
alias vsd="vault server -log-level=trace -dev -dev-root-token-id=root"
alias vrd="VAULT_API_ADDR=http://127.0.0.1:8200 vault server -log-level=trace -dev -dev-root-token-id=root -dev-ha -dev-transactional"
alias vrd2="VAULT_API_ADDR=http://127.0.0.1:8202 vault server -log-level=trace -dev -dev-root-token-id=root -dev-listen-address=127.0.0.1:8202 -dev-ha -dev-transactional"
alias vrd3="VAULT_API_ADDR=http://127.0.0.1:8204 vault server -log-level=trace -dev -dev-root-token-id=root -dev-listen-address=127.0.0.1:8204 -dev-ha -dev-transactional"
alias tmux="tmux -2"
alias oldrepem="vault write -f sys/replication/performance/primary/enable; vault write -field wrapping_token sys/replication/performance/primary/secondary-token id=asdf | vault2 write sys/replication/performance/secondary/enable token=-"
alias repem="vault write -f sys/replication/performance/primary/enable; vault2 write -f -field=secondary_public_key sys/replication/performance/secondary/generate-public-key | vault write -field token sys/replication/performance/primary/secondary-token id=asdf secondary_public_key=- | vault2 write sys/replication/performance/secondary/enable token=-"
alias drem="vault write -f sys/replication/dr/primary/enable; vault2 write -f -field=secondary_public_key sys/replication/dr/secondary/generate-public-key | vault write -field token sys/replication/dr/primary/secondary-token id=asdf secondary_public_key=- | vault2 write sys/replication/dr/secondary/enable token=-"
alias olddrem="vault write -f sys/replication/dr/primary/enable; vault write -field wrapping_token sys/replication/dr/primary/secondary-token id=asdf | vault2 write sys/replication/dr/secondary/enable token=-"
alias drem2="vault2 write -f sys/replication/dr/primary/enable; vault2 write -field wrapping_token sys/replication/dr/primary/secondary-token id=asdf | vault3 write sys/replication/dr/secondary/enable token=-"

alias kc='eval `keychain --eval --agents ssh --inherit any personal_rsa`'
alias git='hub'

export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"

. "$HOME/.profile-private"
