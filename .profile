# custom aliases
[ ! -e ~/.aliases ] || . ~/.aliases

# WSL 2 networking host IP
DISPLAY=$(cat /etc/resolv.conf | grep name | cut -d' ' -f2):0.0

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# add `.local/bin` to path (includes xdg-open-wsl: https://github.com/cpbotha/xdg-open-wsl)
export PATH="$HOME/.local/bin:$PATH"

# solarized dircolors
if [ -f ~/.dir_colors ]; then
	eval $(dircolors ~/.dir_colors)
fi

# P10K
# FIXME customize prompt username/location
#prompt_context() {
#  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
#  fi
#}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
