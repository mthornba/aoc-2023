#!/usr/bin/env bash

sum=0
numbers=(one two three four five six seven eight nine)

while read -r line; do
  sparse_numbers=()
  for ((i=1; i<="${#numbers[@]}"; i++)); do
    value=$i
    for j in $i ${numbers[$(( i - 1 ))]}; do
      remain=$line
      while [[ "${remain}" =~ "$j" ]]; do
        remain=${remain#*"$j"}
        pos=$(( ${#line} - ${#remain} - ${#j} ))
        if [[ $pos -ge 0 ]]; then
          sparse_numbers[pos]=$value
        fi
        sparse_numbers[pos]=$value
      done
    done
  done
  dense_numbers=("${sparse_numbers[@]}")
  calibration_number="${dense_numbers[0]}${dense_numbers[-1]}"
  sum=$((sum + calibration_number))
done < "$1"

echo $sum
