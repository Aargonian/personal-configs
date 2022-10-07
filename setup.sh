#!/bin/bash

if [ "$EUID" -eq 0 ]
    then echo "Please do not run this script as root."
    exit
fi

packages=(
    # Terminal Programs
    "tmux"
    "screen"
    "nmon"
    "htop"
    "gvim"
    "terminator"

    "dmenu"
    "base-devel"
    "cmake"
    "git"
    "firefox"
    "rustup"
)

package_list=""
for package in ${packages[@]}; do
    package_list="$package_list $package"
done

sudo pacman -Syu
sudo pacman -Svyu $package_list

cd $HOME
mkdir -p ./src/git
cd ./src/git
git clone https://github.com/ryanoasis/nerd-fonts
cd ./nerd-fonts
./install.sh
cd $HOME

