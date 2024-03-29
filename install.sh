#!/bin/bash

mkdir -p ~/.config/helix

INSTALL='
  .alacritty.yml
  .config/helix/config.toml
  .dircolors
  .radare2rc
  .tmux.colors.conf
  .tmux.conf
  .zshrc
'

make_relative() {
  local from=$1
  local to=$2
  python3 -c"
import os.path
print(os.path.relpath('$from', '$to'))
"
}

where=$(make_relative $(dirname $0) $HOME)
for i in $INSTALL; do
  if [ -r $HOME/$i ]; then
    echo "skip $i"
    continue
  fi
  echo "link $i"
  ln -s $HOME/$where/$i $HOME/$i
done

touch $HOME/.zshrc.local
