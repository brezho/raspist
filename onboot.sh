#!/bin/bash

logfile = /home/pi/onboot.txt;

date > $logfile;

if [[ ! -d /home/pi/version ]]; then
  mkdir /home/pi/version;
fi

if [[ ! -e /home/pi/version/001 ]]; then
  echo "apt" > $logfile;
  sudo apt-get update;
  sudo apt-get upgrade;
  echo "download dotnet" > $logfile;
  wget https://download.visualstudio.microsoft.com/download/pr/8ccacf09-e5eb-481b-a407-2398b08ac6ac/1cef921566cb9d1ca8c742c9c26a521c/aspnetcore-runtime-3.1.2-linux-arm.tar.gz;
  mkdir /home/pi/dotnet-arm32;
  tar zxf aspnetcore-runtime-3.1.2-linux-arm.tar.gz -C /home/pi/dotnet-arm32
  touch /home/pi/version/001;
fi

export DOTNET_ROOT=/home/pi/dotnet-arm32;
export PATH=$PATH:/home/pi/dotnet-arm32;
echo "path = $PATH" > $logfile;
