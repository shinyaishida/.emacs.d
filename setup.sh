#!/bin/sh

pwd=$(pwd)/${0%%setup.sh}
emacsd=.emacs.d
emacsel=.emacs.el
inits=inits

cd $HOME
[ -e ${emacsd} ] && {
    echo "$HOME/${emacsd} exists"
} || {
    ln -s ${pwd} ${emacsd}
}
[ -e ${emacsel} ] && {
    echo "$HOME/${emacsel} exists"
} || {
    ln -s ${emacsd}/emacs.el ${emacsel}
}
[ -e ${inits} ] && {
    echo "${inits} exists"
} || {
    mkdir ${inits}
    echo "use utils/init-manager to enable loaders"
}
cd - > /dev/null
