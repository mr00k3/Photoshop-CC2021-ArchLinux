#!/bin/bash

if [ "$1" = '' ]; then
    echo "Error: You are missing path where photoshop is installed eg. "/home/user/""
    exit 1
fi

rm -rf $1/Adobe-Photoshop
rm -rf ~/.local/share/icons/photoshop.png
rm -rf  ~/.local/share/applications/photoshop.desktop
rm -rf allredist.tar.xz
rm -rf 'allredist/'
rm -rf winetricks
rm -rf 'Adobe Photoshop 2021/' 

echo "Photoshop uninstalled"