#!/bin/bash

readonly PROGDIR=$(readlink -m $(dirname $0))

set -x

mkdir -p ~/.vim/bundle
test -d ~/.vim/bundle/Vundle.vim || \
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

test -f ~/.vimrc || ln -s $PROGDIR/vimrc_vundle ~/.vimrc
test -f ~/.ctags || ln -s $PROGDIR/ctagsrc ~/.ctags
mkdir -p ~/.tags
cp -f tags/* ~/.tags/
