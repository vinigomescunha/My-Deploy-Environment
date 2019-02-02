#!/bin/bash
# title           : create-hooks.sh
# description     : Insert hooks into git repository to custom activities during commit, push, ...  
# author          : vinigomescunha
# date            : 2019-02-01
# bash_version    : 4.2
#==============================================================================
for hook in ./my-git-hooks/* ; do
  ln -s -f $(realpath $hook) ./.git/hooks/$(basename $hook)
done
