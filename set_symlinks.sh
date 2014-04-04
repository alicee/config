#!/usr/bin/env bash

me=`basename $0`
cwd=`pwd`
for f in $cwd/*
do
  echo $me
  if [ $me != $f ]
  then
    fn=`echo $f| sed 's,^[^ ]*/,,'`
    #ln -sf $f $HOME/.$fn
  fi
done

