#!/bin/bash

# Fix the power button to hibernate instead of shutdown, hibernate on laptop lid shut
mv /etc/systemd/logind.conf /etc/systemd/logind.conf.bak
ln -sv ./sys-files/logind.conf /etc/systemd/logind.conf
