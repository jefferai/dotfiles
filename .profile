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

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export GOPATH=$HOME/go
export GOROOT_BOOTSTRAP=/usr/local/go
export CGO_ENABLED=0
export PATH=$GOPATH/src/github.com/hashicorp/vault/bin:$GOPATH/bin:$PATH

export VAULT_ADDR="http://127.0.0.1:8200"

alias gov="cd ~/go/src/github.com/hashicorp/vault"
alias ack="ack-grep --ignore-dir=Godeps --ignore-dir=website"
alias vsd="vault server --dev"

alias kc="keychain personal_rsa"

export PATH="$HOME/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
