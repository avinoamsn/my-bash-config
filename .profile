##################
# misc
##################

# source custom aliases
[ ! -e ~/.aliases ] || . ~/.aliases

# WSL 2 networking host IP
# TODO is this still necessary?
DISPLAY=$(cat /etc/resolv.conf | grep name | cut -d' ' -f2):0.0

# add `.local/bin` to path (includes xdg-open-wsl: https://github.com/cpbotha/xdg-open-wsl)
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

##################
# p10k setup
##################

# solarized dircolors
if [ -f ~/.dir_colors ]; then
	eval $(dircolors ~/.dir_colors)
fi

# `history` cmd format
export HISTTIMEFORMAT="%d/%m/%y %T "

# p10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
