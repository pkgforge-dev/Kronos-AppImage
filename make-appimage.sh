#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q kronos | awk '{print $2; exit}') # example command to get version of application here
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/pixmaps/kronos.png
export DESKTOP=/usr/share/applications/kronos.desktop
export APPNAME=Kronos

# Deploy dependencies
quick-sharun /usr/bin/kronos /usr/share/kronos

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage
