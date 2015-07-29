#!/bin/bash
#
#This is a simple script to install my dotfiles
#it is important to have the folder under ~/dotfiles,
#else edit the $dir
#
#This script dosen't have a backup function, all thinks are mentioned to be
#stored in the dotfiles

dir=$HOME/dotfiles
print "Start syncing..."

print "Link $HOME/.vimrc"
ln -s $dir/vim/.vimrc $HOME/.vimrc

print "Next..."
print "Link vim plugins to $HOME/.vim"
for file in $dir/vim/*;do
	#Dont need to care about .vimrc it is not in the iter
	ln -s $file $HOME/.vim/
done

print "Next..."
print "Link i3 config to $HOME/.i3"
mkdir -p $HOME/.i3
for file in $dir/i3/*;do
	ln -s $file $HOME/.i3/
done
print "Done..."


