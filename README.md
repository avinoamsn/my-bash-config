# My Zsh Terminal Configuration

This repo contains a handful of files I use to customize my Zsh experience.

## Instructions

1. Copy the relevant configuration files to the home directory:

    ```sh
    cp .aliases .gitconfig .p10k.zsh .profile .zshrc ~
    ```

2. Install the various tools & plugins:
    - [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
        - [oh-my-zsh](https://ohmyz.sh/#install)
            - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)
            - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)
            - [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting#oh-my-zsh)
            - [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search#install)
            - [autojump](https://github.com/wting/autojump#automatic)

                ```sh
                sudo apt install autojump
                ```

            - [powerlevel10k](https://github.com/romkatv/powerlevel10k#oh-my-zsh)
    - [pyenv](https://github.com/pyenv/pyenv-installer#install)
    - [nvm](https://github.com/nvm-sh/nvm#install--update-script)
        **NOTE:** The NVM sourcing config is already included in the provided `.profile` file, to avoid duplicating the config run the `nvm` installer like this:

        ```sh
        PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash'
        ```

### Working with WSL & VS Code

Additional instructions for setting up the development environment.

1. Install [Windows Terminal](https://www.microsoft.com/store/productId/9N0DX20HK701?ocid=pdpshare)
   a. Copy the contents of the `terminal.json` file to the Windows Terminal settings (_Settings_ -> _Open JSON File_).
2. Install [Ubuntu](https://www.microsoft.com/store/productId/9PDXGNCFSCZV?ocid=pdpshare)
3. Install [VS Code](https://apps.microsoft.com/store/detail/XP9KHM4BK9FZ7Q?ocid=pdpshare)
4. Install the necessary fonts:
    - [MesloLGS NF](https://github.com/romkatv/powerlevel10k/blob/master/font.md) - used by powerlevel10k
    - [Fira Code](https://github.com/tonsky/FiraCode/wiki/VS-Code-Instructions) - used by VS Code
