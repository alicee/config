#!/usr/bin/env bash

sudo kb3700_fanctrl -f 0 0 0 73 80 100 100 100
sudo ./kb3700_2 -f 0 0 0 60 75 87 100 100
sudo node msi-keyboard/examples/alice_three.js

