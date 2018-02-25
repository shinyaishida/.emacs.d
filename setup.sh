#!/bin/bash

readonly emacsd=.emacs.d
readonly emacs_home=$HOME/${emacsd}
readonly inits=${emacs_home}/inits
readonly init_manager=${emacs_home}/utils/init-manager

[ -e ${emacs_home} ] && {
  echo "${emacs_home} exists"
} || {
  ln -s $(cd ${0%/*}; pwd) ${emacs_home}
}
[ -e ${inits} ] && {
  echo "${inits} exists"
} || {
  echo "create ${inits}"
  mkdir ${inits}
}
echo "use ${init_manager} to manage loaders"
