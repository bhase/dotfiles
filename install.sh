#!/bin/bash

# prerequisites: git curl vim
# and a network connection...

GIT=$(which git)
CURL=$(which curl)
VIM=$(which vim)

if [ ! -x $GIT ] ; then
	echo git needs to be installed
	exit 0
fi

if [ ! -x $CURL ] ; then
	echo curl needs to be installed
	exit 0
fi

if [ ! -x $VIM ] ; then
	echo vim needs to be installed
	exit 0
fi

# create symlinks
for i in gammurc task taskrc vimrc Xresources zsh zshrc ; do
	ln -s $i ~/.$i
done

# install rvm
$CURL -L https://get.rvm.io | bash -s stable

# install vundle and bundles
$GIT clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
$VIM -c BundleInstall -c q -c q

# list of packages to be installed
rvm requirements
echo packages to be installed
echo launchy taskwarrior zsh rxvt-unicode meld gammu wammu cscope
echo
echo gems to be installed after ruby
echo rake-builder cucumber sinatra
