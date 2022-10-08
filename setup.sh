#!/bin/bash

if [ "$EUID" -eq 0 ]
    then echo "Please do not run this script as root."
    exit
fi

packages=(
    # Base Packages
    "base"

    # Terminal Programs
    "tmux"
    "screen"
    "nmon"
    "htop"
    "gvim"
    "terminator"

    # "Desktop Environment" lol
    "i3"
    "dmenu"
    "feh"
    "nitrogen"
    "firefox"
    "xfce4"
    "xfce4-goodies"
    "networkmanager"
    "blueberry"

    # "Development Tools"
    "base-devel"
    "cmake"
    "git"
    "rustup"
)

package_list=""
for package in ${packages[@]}; do
    package_list="$package_list $package"
done

sudo pacman -Syu $package_list

cd $HOME
mkdir -p ./src/git
cd ./src/git
git clone https://github.com/ryanoasis/nerd-fonts --depth=1
cd ./nerd-fonts
./install.sh
cd $HOME

git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
