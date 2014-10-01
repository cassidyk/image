#!/bin/bash

a='./in/dd/mnt'
mnt=$(< $a)

b='./in/dd/src'
src=$(< $b)

c='./in/dd/des'
des=$(< $c)

d='./in/dd/time'
time=$(< $d)
time+=$(echo $src | cut -c 6-11)

echo parted -ms $src print > $mnt$des/"$time"_layout.bak

# calculate size of parition table
name=$(echo $src | cut -c 6-9)
count=$(parted -ms $src print | tail -n+3 | grep . -c)
space=$(lsblk | grep "$name" | head -n 1 | tr -s ' ' | cut -d ' ' -f4 | head -c -2)
e=$((1024 + ($space * $count)))
echo $time
pv $src | dd of=$mnt$des/"$time"_table.img bs=1 count=$e
