#!/bin/bash

CWD=$(pwd)

link_sys_file () {
	sudo mv $2 $2.bak
	sudo ln -sv $CWD/sys-files/$1 $2
}

# Fix the power button to hibernate instead of shutdown, hibernate on laptop lid shut
link_sys_file logind.conf /etc/systemd/logind.conf
