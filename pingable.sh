#!/bin/bash

## script scans a network, and print the online hosts
SUBNET="192.168"
for OCT3 in $(seq 0 254)
do
  for OCT4 in $(seq 1 254)
  do
    IP="${SUBNET}.${OCT3}.${OCT4}"
    echo -n "Checking $IP... "
    if ping -c 1 -W 1 $IP &>/dev/null; then
      echo "UP"
    else
      echo "DOWN"
    fi
  done
done
