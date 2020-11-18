# ! WIP USE WITH CAUTION

echo "\e[42m\e[90mThis script will install zsh/oh-my-zsh, nvm, pyenv, and Docker on Ubuntu. Cancel now if that isn't what you want."
echo "\e[44mLast updated: 11/6/2020\e[0m"
# sleep(3) # ! doesn't currently work in WSL https://github.com/microsoft/WSL/issues/4898

# apt
echo "\e[32mSetting up apt & miscellaneous packages...\e[0m"
sudo apt update
sudo apt upgrade -y

# zsh/shell & oh-my-zsh
echo "\e[32mSetting up zsh, oh-my-zsh & shell packages...\e[0m"
sudo apt install -y zsh
zsh --version # check version
chsh -s $(which zsh) # install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
[ -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ] && echo '\e[33mYou already have pk10k installed.\e[0m' ||
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


# nvm
echo "\e[32mSetting up nvm...\e[0m"
[ -d $HOME/.nvm ] && echo "\e[33mYou already have nvm installed.\e[0m" ||

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
echo "\e[32mSetting up Docker...\e[0m"
sudo apt remove docker docker-engine docker.io containerd runc # fresh install
sudo apt install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg-agent \
	software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - # ? fix for WSL Ubuntu 20.04: https://github.com/microsoft/WSL/issues/5125#issuecomment-629811205
echo "\e[34mFINGERPRINT (this can be checked against here: https://docs.docker.com/engine/install/ubuntu/)\e[0m"
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
	"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
echo "\e[32mDone\!\e[0m"
echo "\e[32mFor help installing Docker in WSL 1/2, please visit: https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly\e[0m"
echo "\e[41mREMEMBER TO UPDATE YOUR GPG SIGNING KEY IN .gitconfig\!\e[0m"
# restart
zsh
