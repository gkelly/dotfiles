#!/bin/bash

INSTALL='
  .dircolors
  .tmux.conf
  .vim
  .vimrc
  .wmii
  .zshrc
'

make_relative() {
  local from=$1
  local to=$2
  python -c"
import os.path
print os.path.relpath('$from', '$to')
"
}

where=$(make_relative $(dirname $0) $HOME)
for i in $INSTALL; do
  if [ -r $HOME/$i ]; then
    echo "skip $i"
    continue
  fi
  echo "link $i"
  ln -s $where/$i $HOME/$i
done

touch ~/.zshrc.local
