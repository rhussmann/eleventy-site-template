#!/usr/bin/env sh

URL=$1

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     xdg-open $1;;
    Darwin*)    open $1;;
esac
