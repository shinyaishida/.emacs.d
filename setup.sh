#!/bin/bash

readonly emacsd=.emacs.d
readonly emacs_home=$HOME/${emacsd}
readonly inits=${emacs_home}/inits
readonly inits_manager=${emacs_home}/inits/inits-manager

[ -e ${emacs_home} ] && {
  echo "${emacs_home} exists"
} || {
  echo "create ${emacs_home}"
  ln -s $(cd ${0%/*}; pwd) ${emacs_home}
}
[ -e ${inits} ] && {
  echo "${inits} exists"
} || {
  echo "create ${inits}"
  mkdir ${inits}
}
echo "use ${inits_manager} to manage loaders"
