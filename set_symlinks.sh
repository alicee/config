#!/usr/bin/env bash

cwd=`pwd`
for f in $cwd/*
do
  fn=`echo $f| sed 's,^[^ ]*/,,'`
  ln -sf $f $HOME/.$fn
done

