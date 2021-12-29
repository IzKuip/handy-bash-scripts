#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo -e "\n\e[91mERROR\e[39m: Cannot satisfy dependencies without root.\n"
  exit
fi

clear

echo -e "\e[96m  _______       ______\e[34m   ___         __                    \e[95m____           __        ____"
echo -e "\e[96m /_  __/ |     / /  _/\e[34m  /   | __  __/ /_____              \e[95m/  _/___  _____/ /_____ _/ / /"
echo -e "\e[96m  / /  | | /| / // /\e[34m   / /| |/ / / / __/ __ \\   \e[90m______\e[95m    / // __ \\/ ___/ __/ __ \`/ / / "
echo -e "\e[96m / /   | |/ |/ // /\e[34m   / ___ / /_/ / /_/ /_/ /  \\e[90m/_____/\e[95m  _/ // / / (__  ) /_/ /_/ / / /  "
echo -e "\e[96m/_/    |__/|__/___/\e[34m  /_/  |_\\__,_/\\__/\\____/           \e[95m/___/_/ /_/____/\\__/\\__,_/_/_/   \e[39m"

set currentdir = pwd

packages=("neofetch" "gdm3" "firefox" "git" "gnome" "flameshot" "nodejs" "npm")
gnomePackages=("characters" "control-center" "tweaks" "core" "disk-utility" "builder" "boxes" "audio" "font-viewer" "terminal" "session" "shell" "system-monitor" "system-tools" "user-share")
snapPackages=("spotify" "onlyoffice-desktopeditors")
classicSnapPackages=("go")

echo -e "\n[\e[34mAUTO-INSTALL\e[39m] Installing APT Packages...\n"

for i in ${packages[@]}; do
    echo -e "[\e[34m  APT  \e[39m] Installing \e[35mgnome-$i\e[39m..."
    #sudo apt install $i -y &>/dev/null
done

echo -e "\n[\e[34mAUTO-INSTALL\e[39m] Installing GNOME Packages...\n"

for i in ${gnomePackages[@]}; do
    echo -e "[\e[34m GNOME \e[39m] Installing \e[35mgnome-$i\e[39m..."
    #sudo apt install gnome-$i -y &>/dev/null
done

echo -e "\n[\e[34mAUTO-INSTALL\e[39m] Installing SNAP packages...\n"

for i in ${snapPackages[@]}; do
    echo -e "[\e[34m SNAP  \e[39m] Installing \e[35m$i\e[39m..."
    #sudo snap install $i &>/dev/null
done

for i in ${classicSnapPackages[@]}; do
    echo -e "[\e[34m SNAP  \e[39m] Installing \e[35m$i\e[39m..."
    #sudo snap install $i --classic &>/dev/null
done

echo -e "\n[\e[34mAUTO-INSTALL\e[39m] Downloading and running pfetch installer..."

wget -qO - https://cutt.ly/AEoGNbu | sudo bash

echo -e "[\e[34mAUTO-INSTALL\e[39m] Downloading and running net-test installer..."

wget -qO - https://cutt.ly/eRX3q0B | sudo bash

echo -e "[\e[34m CHSH  \e[39m] Please specify your username to change the shell:\n"

PROMPT="username: "

read -e -r -p "${PROMPT}" username

echo -e "\n[\e[34m CHSH  \e[39m] Changing shell to fish...\n"

chsh -s /usr/bin/fish $username