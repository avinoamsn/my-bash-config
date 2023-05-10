##################
# misc
##################

# source custom aliases
[ ! -e ~/.aliases ] || . ~/.aliases

# WSL 2 networking host IP
# TODO is this still necessary?
DISPLAY=$(cat /etc/resolv.conf | grep name | cut -d' ' -f2):0.0

# add `.local/bin` to path (includes `git-filter-repo` - https://github.com/newren/git-filter-repo/blob/main/INSTALL.md)
# TODO ""
export PATH="$HOME/.local/bin:$PATH"

##################
# pyenv setup
##################

# add pyenv to path
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# load pyenv into shell
eval "$(pyenv init -)"

##################
# nvm setup
##################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# call `use nvm` automatically whenever `.nvmrc` is detected
autoload -U add-zsh-hook

load-nvmrc() {
	local nvmrc_path
	nvmrc_path="$(nvm_find_nvmrc)"

	if [ -n "$nvmrc_path" ]; then
		local nvmrc_node_version
		nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

		if [ "$nvmrc_node_version" = "N/A" ]; then
			nvm install
		elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
			nvm use
		fi
	elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
		echo "Reverting to nvm default version"
		nvm use default
	fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

##################
# p10k setup
##################

# solarized dircolors
if [ -f ~/.dir_colors ]; then
	eval $(dircolors ~/.dir_colors)
fi

# `history` cmd format
export HISTTIMEFORMAT="%d/%m/%y %T "
