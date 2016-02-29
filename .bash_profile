
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=Solarized
. ~/.bash-git-prompt/gitprompt.sh

stty -ixon

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
  make dev;
  popd;
}
