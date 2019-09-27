#!/bin/bash
# This script migrates from Emacs to Spacemacs and vice-versa by moving config files and folders

echo "$EMACS"
if [ "$EMACS" = true ]
then
    # switch .emacs
    mv .emacs .emacs.bak
    # mv .spacemacs.bak .spacemacs
    # Switch .emacs.d/
    mv .emacs.d .emacs.d.bak
    mv .spacemacs.d.bak .emacs.d
    echo export EMACS=false >> $HOME/.bashrc
    export EMACS=false
    exit 0
fi
if [ "$EMACS" = false ]
then
    # switch .emacs
    # mv .spacemacs .spacemacs.bak
    mv .emacs.bak .emacs
    # switch .emacs.d/
    mv .emacs.d .spacemacs.d.bak
    mv .emacs.d.bak .emacs.d
    export EMACS=true
    echo export EMACS=true >> $HOME/.bashrc
fi
