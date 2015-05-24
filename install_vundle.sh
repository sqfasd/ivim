#!/bin/bash

readonly PROGDIR=$(readlink -m $(dirname $0))

set -x

mkdir -p ~/.vim/bundle
test -d ~/.vim/bundle/Vundle.vim || \
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -sf $PROGDIR/vimrc_vundle ~/.vimrc
ln -sf $PROGDIR/ctagsrc ~/.ctags
ln -sf $PROGDIR/editorconfig ~/.editorconfig

test -d ~/.tags || mkdir -p ~/.tags
cp -f tags/* ~/.tags/
