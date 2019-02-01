#!/bin/bash
for hook in ./my-git-hooks/* ; do
  ln -s -f $(realpath $hook) ./.git/hooks/$(basename $hook)
done
