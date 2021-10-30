#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo -e "\n\e[91mERROR\e[39m: Root is required to install net-test using this script.\n"
  exit
fi

set currentdir = pwd

cd /usr/bin

echo -e "\n\e[93mSTATUS\e[39m downloading net-test . . ."
curl -s -o net-test "https://raw.githubusercontent.com/TechWorldInc/handy-bash-scripts/main/net-test"

echo -e "\e[93mSTATUS\e[39m allowing net-test execution . . ."
chmod +x ./net-test

echo -e "\e[92mDONE  \e[39m process completed! Have fun!\n"
cd "$currentdir"