#!/bin/bash

a='./in/sshfs/src'
src=$(< $a)

b='./in/sshfs/des'
des=$(< $b)

c='./in/sshfs/mnt'
mnt=$(< $c)

# umount if $mnt in use
if mount | grep $mnt > /dev/null; then
  umount $mnt
fi

sshfs $src:$des $mnt
