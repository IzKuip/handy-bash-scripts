#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo -e "\n\e[91mERROR\e[39m: Root is required to install afetch using this script.\n"
  exit
fi

set currentdir = pwd

cd /usr/bin

echo -e "\n\e[93mSTATUS\e[39m downloading afetch . . ."
curl -s -o afetch "https://raw.githubusercontent.com/vyxxr/afetch/master/afetch"

echo -e "\e[93mSTATUS\e[39m allowing afetch execution . . ."
chmod +x ./afetch

echo -e "\e[92mDONE  \e[39m process completed! Have fun!\n"
cd "$currentdir"