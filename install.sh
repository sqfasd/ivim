#!/bin/bash

VIM_DIR=~/i/ivim
TEMP_DIR=~/.temp_dirs

test -d $TEMP_DIR || mkdir $TEMP_DIR

test -f ~/.vimrc && mv ~/.vimrc ~/.vimrc.bak
ln -s $VIM_DIR/vimrc ~/.vimrc

test -L ~/.vim_runtime && rm ~/.vim_runtime
test -d ~/.vim_runtime && mv ~/.vim_runtime ~/.vim_runtime.bak
ln -s $VIM_DIR/vim_runtime ~/.vim_runtime
