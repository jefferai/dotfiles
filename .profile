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

export GOROOT_BOOTSTRAP=/usr/lib/go-1.6
export GOPATH=$HOME/go
export PATH=$GOPATH/src/github.com/hashicorp/vault/bin:$GOPATH/src/github.com/hashicorp/consul/bin:$GOPATH/bin:$HOME/src/go/bin:$PATH

export VAULT_ADDR="http://127.0.0.1:8200"

alias gov="cd ~/go/src/github.com/hashicorp/vault"
alias vsd="vault server -log-level=trace -dev -dev-root-token-id=root"
alias kc="eval $(keychain --eval --agents ssh --inherit any personal_rsa)"
alias tmux="tmux -2"

export PATH="$HOME/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

. "$HOME/.profile-private"
