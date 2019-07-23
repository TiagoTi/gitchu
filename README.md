# Git Change User - gitchu

## To Install

```sh
mkdir -p $HOME/.gitchu
curl -L https://github.com/TiagoTi/gitchu/releases/download/v0.0.3/gitchu.sh -o $HOME/.gitchu/gitchu && chmod +x $HOME/.gitchu/gitchu
export PATH=$PATH:$HOME/.gitchu #or add to path in .bashrc .zshrc
```

## To use

### Add new config

```sh
gitchu.sh --add-key

#please account alias
github-customer-boo-key

#chose your private key name
id_rsa_customer-boo_private_name_key

#please email address
foo@boo.com

#please your name to git repo (this name show in commit)
MyNickName
```

### use outher config

```ssh
gitchu.sh  --use
#chose a config
github-customer-foo-key
github-customer-boo-key
github-customer-foo-boo-key

github-customer-foo-key
```
