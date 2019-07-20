#!/bin/bash

VERSION=1.0.0
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
