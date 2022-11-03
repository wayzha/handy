#!/usr/bin/env bash

HOST="192.168.235.44"

[[ -n $1 ]] && HOST=$1

for size in $(seq 1350 1480); do
  ping -c 1 -w 1 -M do -s $size $HOST|tr -d "\n"
  echo "\n"
done | tee ping_size_test.txt

cat ping_size_test.txt | cut -d " " -f 4,13,16,17
