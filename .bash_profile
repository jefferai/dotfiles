
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

if [ -f /usr/local/bin/brew ] && [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

stty -ixon

vault2 () {
  VAULT_ADDR=http://127.0.0.1:8202 vault $@
}

vault3 () {
  VAULT_ADDR=http://127.0.0.1:8204 vault $@
}

checkout-pr () {
  git fetch origin pull/$1/head:pr-$1 && git checkout pr-$1;
}

cl () {
  git add CHANGELOG.md;
  git commit -m "changelog++";
}

giv () {
  pushd -n $(pwd);
  gov;
  time make dev;
  popd;
}

gev () {
  pushd -n $(pwd);
  gov;
  time make entdev;
  popd;
}

guv () {
  go get -u $1;
  govendor update $1;
}

qq() {
    clear

    logpath="$TMPDIR/q"
    if [[ -z "$TMPDIR" ]]; then
        logpath="/tmp/q"
    fi

    if [[ ! -f "$logpath" ]]; then
        echo 'Q LOG' > "$logpath"
    fi

    tail -100f -- "$logpath"
}

rmqq() {
    logpath="$TMPDIR/q"
    if [[ -z "$TMPDIR" ]]; then
        logpath="/tmp/q"
    fi
    if [[ -f "$logpath" ]]; then
        rm "$logpath"
    fi
    qq
}

install_dotfiles () {
  cd ~
  # Install some common stuff
  sudo apt-get install vim jq bash-completion tmux zip unzip
  # Install bash-git-prompt
  git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1
  # Install vim-plug and plugins
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vi -c ':PlugUpdate'
  # Install tmux plugin manager
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  # Map neovim config
  ln -s ~/.vim ~/.config/nvim
  ln -s ~/.vimrc ~/.config/nvim/init.vim
}

#test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

source /home/jeff/.config/broot/launcher/bash/br
