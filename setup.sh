#!/bin/bash

# This is the main setup file to be run on a new Arch-based system.
# This file only invokes the other files under the bin directory.
# Run those individual files if you only need a part of the setup.

source ./bin/setup-packages.sh
source ./bin/setup-configs.sh
source ./bin/setup-sys.sh
