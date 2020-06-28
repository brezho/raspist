#!/bin/bash

date > /home/pi/onboot.txt

if [[ ! -d /home/pi/version ]]; then
  mkdir /home/pi/version;
fi
