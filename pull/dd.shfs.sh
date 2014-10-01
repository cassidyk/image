#!/bin/bash

a='./in/dd/mnt'
mnt=$(< $a)

b='./in/dd/src'
src=$(< $b)

c='./in/dd/des'
des=$(< $c)

d='/mnt/a'

e='./in/dd/time'
time=$(< $e)
time+=$(echo $src | cut -c 6-11)

# copy full partition or filesystem
if echo $src | grep '[0-9]' >/dev/null; then
  if mount | grep $d >/dev/null; then
    ## replace with incrementing mnt letter
    umount $d
  fi
  mount $src $d

  # clean empty space (reduces image size and secure deletes)
  #dd if=/dev/zero of=$d/wash.tmp bs=4M
  #rm $d/wash.tmp

  mksquashfs $d $mnt$des/$time.shfs
else
  dd if=$src bs=4096 conv=notrunc,noerror,sync | pv | gzip -c -9 > $mnt$des/$time.img
fi

umount $d
