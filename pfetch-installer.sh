#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo -e "\n\e[91mERROR\e[39m: Root is required to install pfetch using this script.\n"
  exit
fi

set currentdir = pwd

cd /usr/bin

echo -e "\n\e[93mSTATUS\e[39m downloading pfetch . . ."
curl -s -o pfetch "https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch"

echo -e "\e[93mSTATUS\e[39m allowing pfetch execution . . ."
chmod +x ./pfetch

echo -e "\e[92mDONE  \e[39m process completed! Have fun!\n"
cd "$currentdir"