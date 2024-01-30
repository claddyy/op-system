#!/bin/bash

is_prime() {
    num=$1
    if [ $num -lt 2 ]; then
        return 1  # Not prime
    fi
    for ((i=2; i*i<=num; i++)); do
        if [ $((num % i)) -eq 0 ]; then
            return 1  # Not prime
        fi
    done
    return 0  # Prime
}
file="oslab.txt"

echo "Prime numbers in $file:"
while read -r number; do
    if [[ "$number" =~ ^[0-9]+$ ]]; then
        is_prime "$number"
        if [ $? -eq 0 ]; then
            echo "$number"
        fi
    fi
done < "$file"

