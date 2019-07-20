#!/bin/bash

VERSION=0.0.1
HOME_GITHUB=$HOME/.gitchu

info() {
    echo "Version: $VERSION"
}

case "$1" in
--info)
    info
    ;;
*)
    info
    ;;
esac
