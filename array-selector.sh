#!/bin/bash

colors=("red" "blue" "green" "white" "black")

if [[ $# -ne 1 ]]; then
    echo "Error"
elif [[ ! $1 =~ ^[0-9]+$ ]]; then
    echo "Error"
else
    index=$1
    if (( index < 1 || index > ${#colors[@]} )); then
        echo "Error"
    else
        echo "${colors[index-1]}"
    fi
fi