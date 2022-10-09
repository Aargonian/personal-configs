#!/bin/bash

if [ "$EUID" -eq 0 ]
    then echo "Please do not run this script as root."
    exit
fi

packages=(
    # Base Packages
    "base"
    "base-devel"

    # Terminal Programs
    "zsh"
    "tmux"
    "screen"
    "nmon"
    "htop"
    "gvim"
    "terminator"
    "wget"
    "curl"
    "rsync"

    # "Desktop Environment" lol
    "i3"                # i3 Window Manager
    "lightdm"           # Login Manager
    "picom"             # Compositor for Transparency in i3
    "dmenu"             # Gotta open programs somehow
    "feh"               # Set a single background. Nitrogen is better though.
    "nitrogen"          # Set multiple desktop backgrounds.
    "networkmanager"    # Manager WiFi and Ethernet Networks Easily
    "blueberry"         # Gotta manage Bluetooth somehow
    "xautolock"         # Automatic Desktop Locker

    # "Development Tools"
    "base-devel"
    "cmake"
    "git"
    "rustup"

    # Desktop Programs
    "vlc"               # Musie/Video Player
    "calibre"           # Ebook Library Manager
    "xreader"           # PDF Reader
    "firefox"           # Preferred Web Browser

    # Other
)

package_list=""
for package in ${packages[@]}; do
    package_list="$package_list $package"
done

sudo pacman --needed --noconfirm -Syu $package_list
