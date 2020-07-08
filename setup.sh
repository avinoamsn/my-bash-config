# ! WIP USE WITH CAUTION

# apt
echo "\e[32mSetting up apt & miscellaneous packages...\e[0m"
sudo apt update
sudo apt upgrade -y
sudo apt install -y fortune-mod cowsay # ? cowsay may be installed by default (this & fortune-mod is for the chucknorris ohmyzsh plugin)

# zsh/shell
echo "\e[32mSetting up zsh & shell packages...\e[0m"
sudo apt install -y zsh
[ -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ] && echo '\e[33mYou already have pk10k installed.\e[0m' ||
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# nvm
echo "\e[32mSetting up nvm...\e[0m"
[ -d $HOME/.nvm ] && echo "\e[33mYou already have nvm installed.\e[0m" ||
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# pyenv
echo "\e[32mSetting up pyenv...\e[0m"
# https://realpython.com/intro-to-pyenv/
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
	libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
	libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl
[ -d $HOME/.pyenv ] && echo "\e[33mYou already have pyenv installed.\e[0m" || {
	git clone https://github.com/pyenv/pyenv.git ~/.pyenv
	echo 'export PYENV_ROOT="$HOME/.pyenv"' >>~/.bash_profile
	echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >>~/.bash_profile
}

# Docker

# restart
zsh
