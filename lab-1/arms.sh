#!/bin/bash

power() {
  local base=$1
  local exponent=$2
  local result=1

  for ((i = 1; i <= exponent; i++)); do
    result=$((result * base))
  done

  echo $result
}

is_armstrong() {
  local number=$1
  local num_digits=${#number}
  local temp=$number
  local sum=0

  while [ $temp -gt 0 ]; do
    digit=$((temp % 10))
    sum=$((sum + $(power $digit $num_digits)))
    temp=$((temp / 10))
  done

  [ $sum -eq $number ]
}

if [ $# -eq 0 ]; then
  echo "Usage: $0 filename"
  exit 1
fi

filename=$1

if [ ! -f "$filename" ]; then
  echo "File $filename not found."
  exit 1
fi

echo "Armstrong numbers in $filename:"
while read -r number; do
  if [[ $number =~ ^[0-9]+$ ]]; then
    if is_armstrong "$number"; then
      echo $number
    fi
  else
    echo " "
  fi
done < "$filename"

