#!/usr/bin/env bash

if [ "$1" == "off" ]; then
  sysctl kernel.split_lock_mitigate=0
  echo "[ok]: Split-lock mitigation disabled."
elif [ "$1" == "on" ]; then
  sysctl kernel.split_lock_mitigate=1
  echo "[ok]: Split-lock mitigation enabled."
else
  echo "[E]: You must provide 'on' or 'off'."
  exit 1
fi
