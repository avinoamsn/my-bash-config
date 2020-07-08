# ! WIP USE WITH CAUTION

# apt
echo "\e[32mSetting up apt & miscellaneous packages..."
sudo apt update
sudo apt upgrade -y
sudo apt install -y fortune-mod cowsay # ? cowsay may be installed by default (this is for the chucknorris ohmyzsh plugin)

# zsh/shell
echo "\e[32mSetting up zsh & shell packages..."
sudo apt install -y zsh
[ -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ] && echo '\e[33mYou already have pk10k installed.' ||
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# nvm
echo "\e[32mSetting up nvm..."
[ -d $HOME/.nvm ] && echo "\e[33mYou already have nvm installed." ||
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# pyenv
echo "\e[32mSetting up pyenv..."
[ -d $HOME/.pyenv ] && echo "\e[33mYou already have pyenv installed." || {
	git clone https://github.com/pyenv/pyenv.git ~/.pyenv
	echo 'export PYENV_ROOT="$HOME/.pyenv"' >>~/.bash_profile
	echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >>~/.bash_profile
}

# Docker

# restart
zsh
