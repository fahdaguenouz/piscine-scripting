#!/bin/bash

max=0

for i in {1..10}; do
    read -p "Enter a number: " -r num

    if [[ ! "$num" =~ ^[0-9]+$ ]]; then
        echo "ERROR: Invalid input only positive numerical characters are allowed"
        exit
    fi

    if [ "$num" -gt 10000 ]; then
        echo "ERROR: The number entered is too large"
        exit
    fi

    if [ "$num" -gt "$max" ]; then
        max=$num
    fi
done

echo "The largest number is: $max"