#!/bin/bash

do_add() {
    echo $(($1 + $2))
}

do_sub() {
    echo $(($1 - $2))
}

do_mult() {
    echo $(($1 * $2))
}

do_divide() {
    echo $(($1 / $2))
}

# Check number of arguments
if [ "$#" -ne 3 ]; then
    >&2 echo "Error: expect 3 arguments"
    exit 1
fi

left=$1
operator=$2
right=$3

# Validate numbers (allow negative integers)
number_regex='^-?[0-9]+$'

if ! [[ $left =~ $number_regex && $right =~ $number_regex ]]; then
    >&2 echo "Error: invalid number"
    exit 4
fi

# Division by zero
if [ "$operator" = "/" ] && [ "$right" -eq 0 ]; then
    >&2 echo "Error: division by 0"
    exit 2
fi

# Select operation
case "$operator" in
    "+")
        do_add "$left" "$right"
        ;;
    "-")
        do_sub "$left" "$right"
        ;;
    "*")
        do_mult "$left" "$right"
        ;;
    "/")
        do_divide "$left" "$right"
        ;;
    *)
        >&2 echo "Error: invalid operator"
        exit 3
        ;;
esac