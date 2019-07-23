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

use() {
    echo "chose a config : "
    ls -1 $HOME_GITHUB | grep -v gitch
    read CONFIGURATION

    ACCOUNT_ALIAS=$(cat $HOME_GITHUB/$CONFIGURATION | sed -n '1p')
    SSH_KEY=$(cat $HOME_GITHUB/$CONFIGURATION | sed -n '2p')
    ACCOUNT_EMAIL=$(cat $HOME_GITHUB/$CONFIGURATION | sed -n '3p')
    ACCOUNT_NICK=$(cat $HOME_GITHUB/$CONFIGURATION | sed -n '4p')

    echo $ACCOUNT_ALIAS
    echo $SSH_KEY
    echo $ACCOUNT_EMAIL
    echo $ACCOUNT_NICK

    echo "[user]" >$HOME/.gitconfig
    echo "    name = $ACCOUNT_NICK" >>$HOME/.gitconfig
    echo "    email = $ACCOUNT_EMAIL" >>$HOME/.gitconfig
    cat $HOME/.gitconfig

    ssh-add -D
    ssh-add ~/.ssh/$SSH_KEY
}

case "$1" in
--info)
    info
    ;;
--add-key)
    add-key
    ;;
--use)
    use
    ;;
*)
    info
    ;;
esac
