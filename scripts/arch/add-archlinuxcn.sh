#!/usr/bin/env bash

if [[ $(command -v "reflector") = "" ]]; then
  sudo pacman -S reflector --noconfirm
fi

sudo reflector --country China --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

if [ ! -f /etc/pacman.d/archlinuxcn-mirrorlist ]; then
  cat <<EOT | sudo tee -a /etc/pacman.d/archlinuxcn-mirrorlist
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/\$arch
Server = https://mirrors.ustc.edu.cn/archlinuxcn/\$arch
EOT
fi

if ! grep -q archlinuxcn /etc/pacman.conf; then
  cat <<EOT | sudo tee -a /etc/pacman.conf

[archlinuxcn]
Include = /etc/pacman.d/archlinuxcn-mirrorlist
EOT
fi

sudo pacman -Sy
sudo pacman-key --lsign-key "farseerfc@archlinux.org"
sudo pacman -S archlinuxcn-keyring --noconfirm
sudo pacman -S archlinuxcn-mirrorlist-git --noconfirm

if [ -f /etc/pacman.d/archlinuxcn-mirrorlist.pacnew ]; then
    sudo rm /etc/pacman.d/archlinuxcn-mirrorlist
    sudo mv /etc/pacman.d/archlinuxcn-mirrorlist.pacnew /etc/pacman.d/archlinuxcn-mirrorlist
fi

sudo sed -i 's/#Server = https:\/\/mirrors.cloud.tencent.com/Server = https:\/\/mirrors.cloud.tencent.com/' /etc/pacman.d/archlinuxcn-mirrorlist

sudo sed -i 's/#Server = https:\/\/mirrors.aliyun.com/Server = https:\/\/mirrors.aliyun.com/' /etc/pacman.d/archlinuxcn-mirrorlist

sudo pacman -Syy
