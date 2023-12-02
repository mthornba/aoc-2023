#!/usr/bin/env bash

sum=0

while read line; do
  numbers=$(echo "${line}" | sed -e 's/[^0-9]//g')
  num=${numbers:0:1}${numbers: -1}
  sum=$((sum + num))
done < "$1"

echo $sum
