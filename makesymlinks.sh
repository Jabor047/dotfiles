#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc vimrc vim zshrc config/starship.toml"    # list of files/folders to symlink in homedir

echo -n "Creating $olddir for backup of any existing dotfiles -n ~..."
mkdir -p $olddir
echo -n "done"

echo -n "Changing to the $dir directory"
cd $dir
echo -n "done"

for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/.$file ~/dotfiles_old
	echo "Creating symlink to $file in home directory"
	ln -s $dir/$file ~/.$file
done

ln -s $dir/ohmyzsh ~/.oh-my-zsh

