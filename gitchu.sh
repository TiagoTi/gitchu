#!/bin/bash

VERSION=0.0.2
HOME_GITHUB=$HOME/.gitchu

info() {
    echo "Version: $VERSION"
}

add-key() {
    echo "please account alias"
    read ACCOUNT_ALIAS

    echo "chose your key"
    ls -la $HOME/.ssh
    echo "chose your key"
    read SSH_KEY

    echo "please email address"
    read ACCOUNT_EMAIL

    echo "please your name to git repo"
    read ACCOUNT_NICK

    echo $ACCOUNT_ALIAS
    echo $SSH_KEY
    echo $ACCOUNT_EMAIL
    echo $ACCOUNT_NICK

    touch $HOME_GITHUB/$ACCOUNT_ALIAS

    echo $ACCOUNT_ALIAS >$HOME_GITHUB/$ACCOUNT_ALIAS
    echo $SSH_KEY >>$HOME_GITHUB/$ACCOUNT_ALIAS
    echo $ACCOUNT_EMAIL >>$HOME_GITHUB/$ACCOUNT_ALIAS
    echo $ACCOUNT_NICK >>$HOME_GITHUB/$ACCOUNT_ALIAS
}

case "$1" in
--info)
    info
    ;;
--add-key)
    add-key
    ;;
*)
    info
    ;;
esac
