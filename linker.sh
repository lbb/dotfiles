#!/bin/bash
#
#This is a simple script to install my dotfiles
#it is important to have the folder under ~/dotfiles,
#else edit the $dir
#
#This script dosen't have a backup function, all thinks are mentioned to be
#stored in the dotfiles

dir=$HOME/dotfiles
echo "Start syncing..."

echo "Link $HOME/.vimrc"
ln -sf $dir/vim/.vimrc $HOME/.vimrc
echo "Next..."
echo "Link vim plugins to $HOME/.vim"
for file in $dir/vim/*;do
	#Dont need to care about .vimrc it is not in the iter
	ln -sf $file $HOME/.vim/
done

echo "Next..."
echo "Link i3 config to $HOME/.i3"
mkdir -p $HOME/.i3
for file in $dir/i3/*;do
	ln -sf $file $HOME/.i3/
done
echo "Next..."
echo "Link urxvt config to $HOME/.Xresources"
ln sf $dir/urxvt/.Xresources $HOME/
echo "Done..."


