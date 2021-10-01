
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

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

bdauth() {
	COMMAND="boundary authenticate password -login-name admin -auth-method-id ampw_1234567890 -password password"
	echo -n $COMMAND
	read -n 1
	eval "${COMMAND}"
}

bd_create_hc() {
	COMMAND="boundary host-catalogs create plugin -scope-id p_1234567890 -plugin-name azure -attr disable_credential_rotation=true -attr tenant_id=env://ARM_TENANT_ID -attr subscription_id=env://ARM_SUBSCRIPTION_ID -attr client_id=env://ARM_CLIENT_ID -secret secret_value=env://ARM_CLIENT_SECRET"
	echo -n $COMMAND
	read -n 1
	eval "${COMMAND}" | tee /tmp/hc
}

bd_create_hs_all() {
	HOST_CATALOG_ID=$(cat /tmp/hc  | grep hc_ | awk '{print $2}')
	COMMAND="boundary host-sets create plugin -host-catalog-id ${HOST_CATALOG_ID} -attr filter=\"tagName eq 'service-type' and tagValue eq 'database'\""
	echo -n $COMMAND
	read -n 1
	eval "${COMMAND}" | tee /tmp/hs
}

bd_create_hs_nw() {
	HOST_CATALOG_ID=$(cat /tmp/hc  | grep hc_ | awk '{print $2}')
	COMMAND="boundary host-sets create plugin -host-catalog-id ${HOST_CATALOG_ID} -attr filter=\"tagName eq 'application' and tagValue eq 'north-wind'\""
	echo -n $COMMAND
	read -n 1
	eval "${COMMAND}" | tee /tmp/nw
}

bd_create_hs_ss() {
	HOST_CATALOG_ID=$(cat /tmp/hc  | grep hc_ | awk '{print $2}')
	COMMAND="boundary host-sets create plugin -host-catalog-id ${HOST_CATALOG_ID} -attr filter=\"tagName eq 'application' and tagValue eq 'south-seas'\""
	echo -n $COMMAND
	read -n 1
	eval "${COMMAND}" | tee /tmp/ss
}

bd_read_hs_all() {
	HOST_SET_ALL_ID=$(cat /tmp/hs  | grep hs_ | awk '{print $2}')
	COMMAND="boundary host-sets read -id ${HOST_SET_ALL_ID}"
	echo -n $COMMAND
	read -n 1
	eval "${COMMAND}"
}

bd_read_hs_nw() {
	HOST_SET_NW_ID=$(cat /tmp/nw  | grep hs_ | awk '{print $2}')
	COMMAND="boundary host-sets read -id ${HOST_SET_NW_ID}"
	echo -n $COMMAND
	read -n 1
	eval "${COMMAND}"
}

bd_read_hs_ss() {
	HOST_SET_SS_ID=$(cat /tmp/ss  | grep hs_ | awk '{print $2}')
	COMMAND="boundary host-sets read -id ${HOST_SET_SS_ID}"
	echo -n $COMMAND
	read -n 1
	eval "${COMMAND}"
}

run_bd_side_1() {
	bdauth
	read -n 1
	echo "==========================="
	bd_create_hc
	read -n 1
	echo "==========================="
	bd_create_hs_all
	read -n 1
	echo "==========================="
	bd_read_hs_all
	read -n 1
	echo "==========================="
	bd_read_hs_all
	read -n 1
	echo "==========================="
	bd_read_hs_all
}

run_bd_side_2() {
	bd_create_hs_nw
	read -n 1
	echo "==========================="
	bd_create_hs_ss
	read -n 1
	echo "==========================="
	bd_read_hs_nw
	read -n 1
	echo "==========================="
	bd_read_hs_ss
	read -n 1
	echo "==========================="
	bd_read_hs_ss
	read -n 1
	echo "==========================="
	bd_read_hs_ss
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

source <(kubectl completion bash)

complete -C /home/jeff/go/bin/vault vault
complete -C aws_completer aws

if [ -e /home/jeff/.nix-profile/etc/profile.d/nix.sh ]; then . /home/jeff/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
