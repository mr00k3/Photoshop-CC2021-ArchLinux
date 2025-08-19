#!/bin/bash
# This script is a modified version of the original script by LinSoftWin

if [ "$1" = '' ]; then
    echo "Error: You are missing path where to install photoshop eg. "/home/user/""
    exit 1
fi

echo "Do u want to install dependencies? y/n"
read wantdeps

if [ "$wantdeps" == "y" ]; then
    echo "Installing Dependencies"
    sudo pacman -Sy 
    sudo pacman -S wine appmenu-gtk-module tar wget curl
else
    echo "Skipping installing dependencies"
fi

if [ ! -f "AdobePhotoshop2021.tar.xz" ]; then
    echo "Error: Please download AdobePhotoshop2021.tar.xz to script dir"
    exit 1
fi

sleep 10000
mkdir $1/Adobe-Photoshop

wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks

WINEPREFIX=$1/Adobe-Photoshop wineboot

WINEPREFIX=$1/Adobe-Photoshop ./winetricks win10

curl -L "https://drive.google.com/uc?export=download&id=1qcmyHzWerZ39OhW0y4VQ-hOy7639bJPO" > allredist.tar.xz
mkdir allredist

tar -xf allredist.tar.xz

tar -xf AdobePhotoshop2021.tar.xz

WINEPREFIX=$1/Adobe-Photoshop ./winetricks fontsmooth=rgb gdiplus msxml3 msxml6 atmlib corefonts dxvk win10 vkd3d

WINEPREFIX=$1/Adobe-Photoshop wine allredist/redist/2010/vcredist_x64.exe /q /norestart
WINEPREFIX=$1/Adobe-Photoshop wine allredist/redist/2010/vcredist_x86.exe /q /norestart

WINEPREFIX=$1/Adobe-Photoshop wine allredist/redist/2012/vcredist_x86.exe /install /quiet /norestart
WINEPREFIX=$1/Adobe-Photoshop wine allredist/redist/2012/vcredist_x64.exe /install /quiet /norestart

WINEPREFIX=$1/Adobe-Photoshop wine allredist/redist/2013/vcredist_x86.exe /install /quiet /norestart
WINEPREFIX=$1/Adobe-Photoshop wine allredist/redist/2013/vcredist_x64.exe /install /quiet /norestart

WINEPREFIX=$1/Adobe-Photoshop wine allredist/redist/2019/VC_redist.x64.exe /install /quiet /norestart
WINEPREFIX=$1/Adobe-Photoshop wine allredist/redist/2019/VC_redist.x86.exe /install /quiet /norestart

mkdir $1/Adobe-Photoshop/drive_c/Program\ Files/Adobe
mv Adobe\ Photoshop\ 2021 $1/Adobe-Photoshop/drive_c/Program\ Files/Adobe/Adobe\ Photoshop\ 2021

touch $1/Adobe-Photoshop/drive_c/launcher.sh
echo '#!/usr/bin/env bash' >> $1/Adobe-Photoshop/drive_c/launcher.sh
echo 'SCR_PATH="pspath"' >> $1/Adobe-Photoshop/drive_c/launcher.sh
echo 'CACHE_PATH="pscache"' >> $1/Adobe-Photoshop/drive_c/launcher.sh
echo 'RESOURCES_PATH="$SCR_PATH/resources"' >> $1/Adobe-Photoshop/drive_c/launcher.sh
echo 'WINE_PREFIX="$SCR_PATH/prefix"' >> $1/Adobe-Photoshop/drive_c/launcher.sh
echo 'FILE_PATH=$(winepath -w "$1")' >> $1/Adobe-Photoshop/drive_c/launcher.sh
echo 'export WINEPREFIX="'$1'/Adobe-Photoshop"' >> $1/Adobe-Photoshop/drive_c/launcher.sh
echo 'WINEPREFIX='$1'/Adobe-Photoshop DXVK_LOG_PATH='$1'/Adobe-Photoshop DXVK_STATE_CACHE_PATH='$1'/Adobe-Photoshop wine ' $1'/Adobe-Photoshop/drive_c/Program\ Files/Adobe/Adobe\ Photoshop\ 2021/photoshop.exe $FILE_PATH' >> $1/Adobe-Photoshop/drive_c/launcher.sh

chmod +x $1/Adobe-Photoshop/drive_c/launcher.sh

WINEPREFIX=$1/Adobe-Photoshop winecfg -v win10

mv allredist/photoshop.png ~/.local/share/icons/photoshop.png

# Included mimetypes for default handlers
# Updated name, comment and categories

touch ~/.local/share/applications/photoshop.desktop
echo '[Desktop Entry]' >> ~/.local/share/applications/photoshop.desktop
echo 'Name=Adobe Photoshop 2021' >> ~/.local/share/applications/photoshop.desktop
echo 'Exec=bash -c "'$1'/Adobe-Photoshop/drive_c/launcher.sh %F"' >> ~/.local/share/applications/photoshop.desktop
echo 'Type=Application' >> ~/.local/share/applications/photoshop.desktop
echo 'Comment=The industry-standard photo editing software (Wine)' >> ~/.local/share/applications/photoshop.desktop
echo 'Categories=Graphics;Photography;' >> ~/.local/share/applications/photoshop.desktop
echo 'Icon=$HOME/.local/share/icons/photoshop.png' >> ~/.local/share/applications/photoshop.desktop
echo 'MimeType=image/psd;image/x-psd;' >> ~/.local/share/applications/photoshop.desktop
echo 'StartupWMClass=photoshop.exe' >> ~/.local/share/applications/photoshop.desktop

echo "Photoshop installed!"
