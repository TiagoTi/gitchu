VERSION=1.0.0
HOME_GITHUB=$HOME/.gitchu

install(){
    mkdir -p $HOME_GITHUB
}


add(){
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

    echo $ACCOUNT_ALIAS > $HOME_GITHUB/$ACCOUNT_ALIAS
    echo $SSH_KEY >> $HOME_GITHUB/$ACCOUNT_ALIAS
    echo $ACCOUNT_EMAIL >> $HOME_GITHUB/$ACCOUNT_ALIAS
    echo $ACCOUNT_NICK >> $HOME_GITHUB/$ACCOUNT_ALIAS
}


info(){
    clear
    echo "version: $VERSION"
    
    cat $HOME_GITHUB/gitlab-luizalabs
}

use(){
    ls -la $HOME_GITHUB
    echo "chose a config"
    read CONFIGURATION

    #cat $HOME_GITHUB/$CONFIGURATION

    ACCOUNT_ALIAS=$(cat $HOME_GITHUB/$CONFIGURATION | sed -n '1p')
    SSH_KEY=$(cat $HOME_GITHUB/$CONFIGURATION | sed -n '2p')
    ACCOUNT_EMAIL=$(cat $HOME_GITHUB/$CONFIGURATION | sed -n '3p')
    ACCOUNT_NICK=$(cat $HOME_GITHUB/$CONFIGURATION | sed -n '4p')


    echo $ACCOUNT_ALIAS 
    echo $SSH_KEY
    echo $ACCOUNT_EMAIL
    echo $ACCOUNT_NICK

    echo "[user]" > $HOME/.gitconfig
	echo "    name = $ACCOUNT_NICK" >> $HOME/.gitconfig
    echo "    email = $ACCOUNT_EMAIL" >> $HOME/.gitconfig
    cat $HOME/.gitconfig

    ssh-add -D
    ssh-add ~/.ssh/$SSH_KEY
}


case "$1" in
    --help)
        echo "help"
        ;;
    --install)
        install
        ;;
    --add)
        add
        ;;
    --use)
        use
        ;;
    *)
        info
esac