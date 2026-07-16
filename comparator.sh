#!/bin/bash

[ "$#" -ne 2 ] && { echo "Error: The script only works with two arguments!"; exit; }

[[ ! "$1" =~ ^-?[0-9]+$ || ! "$2" =~ ^-?[0-9]+$ ]] && { echo "Error: Only two numeric arguments are acceptable!"; exit; }

[ "$1" -gt "$2" ] && echo "$1 > $2" && exit
[ "$1" -lt "$2" ] && echo "$1 < $2" && exit
echo "$1 = $2"
