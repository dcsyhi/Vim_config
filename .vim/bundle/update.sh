#!/bin/sh

for d in `ls -d */`; do
  printf "%-30s" $d
  cd $d
  git pull
  cd ..
done
