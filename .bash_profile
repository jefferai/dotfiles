
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f /usr/local/bin/brew ] && [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=Solarized
#GIT_PROMPT_START="\h"
. ~/.bash-git-prompt/gitprompt.sh

stty -ixon

vi () {
  nvim $@
}

checkout-pr () {
  git fetch oss pull/$1/head:pr-$1 && git checkout pr-$1;
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

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
