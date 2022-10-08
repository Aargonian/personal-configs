#!/bin/bash
# Setup the various configuration files throughout the system and install any additional
# git packages or files necessary to make them work. 

CWD=$(pwd)

link_config_file () {
    mv $2 $2.bak
    ln -s $CWD/configs/$1 $2
}

CWD=$(pwd)
echo "Current working directory is:"
echo $CWD

# Assume zsh is installed and install oh-my-zsh and change shell
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh > install_zsh.sh
chmod +x ./install_zsh.sh
RUNZSH='no' ./install_zsh.sh
rm ./install_zsh.sh

# # Install the NERDFonts patched fonts for use in powerline packages
# cd $HOME
# mkdir -p ./src/git
# cd ./src/git
# git clone https://github.com/ryanoasis/nerd-fonts --depth=1
# cd ./nerd-fonts
# ./install.sh
# cd $CWD
#
# # Install Vundle for use with Vim
# git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

# Symlink necessary config files
link_config_file i3config $HOME/.config/i3/config
link_config_file vimrc $HOME/.vimrc
link_config_file tmux.conf $HOME/.tmux.conf
