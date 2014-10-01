#!/bin/bash

cd in/dd
mv src .src
a=$(cat .src | tr -d [:digit:])

count=$(parted -ms $a print | tail -n+3 | grep . -c)

for i in `seq 1 $count`
do
  echo $a$i > src
  cd ../..
  ./dd.shfs.sh
  cd in/dd
done

mv .src src

cd ../..
./dd.boot.sh
