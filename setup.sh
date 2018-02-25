#!/bin/sh

readonly emacsd=.emacs.d
readonly emacsel=.emacs.el
readonly inits=inits

cd $HOME
[ -e ${emacsd} ] && {
  echo "$HOME/${emacsd} exists"
} || {
  readonly pwd=${0%/*}
  ln -s ${pwd} ${emacsd}
}
[ -e ${inits} ] && {
  echo "${inits} exists"
} || {
  echo "create ${inits}"
  mkdir ${inits}
}
echo "use $HOME/${emacsd}/utils/init-manager to manage loaders"
cd - > /dev/null
