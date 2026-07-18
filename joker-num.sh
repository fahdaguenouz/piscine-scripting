#!/bin/bash

# Check number of arguments
if [ $# -ne 1 ]; then
    >&2 echo "Error: wrong argument"
    exit 1
fi

secret=$1

# Secret number must be an integer between 1 and 100
case "$secret" in
    ''|*[!0-9]*)
        >&2 echo "Error: wrong argument"
        exit 1
        ;;
esac

if [ "$secret" -lt 1 ] || [ "$secret" -gt 100 ]; then
    >&2 echo "Error: wrong argument"
    exit 1
fi

for ((i=1; i<=5; ))
do
    tries_left=$((6 - i))

    echo "Enter your guess ($tries_left tries left):"
    read guess

    # Invalid guess: empty, non-numeric, or outside 1-100
    case "$guess" in
        ''|*[!0-9]*)
            continue
            ;;
    esac

    if [ "$guess" -lt 1 ] || [ "$guess" -gt 100 ]; then
        continue
    fi

    if [ "$guess" -lt "$secret" ]; then
        echo "Go up"
        i=$((i + 1))
    elif [ "$guess" -gt "$secret" ]; then
        echo "Go down"
        i=$((i + 1))
    else
        echo "Congratulations, you found the number in $i moves!"
        exit 0
    fi
done

echo "You lost, the number was $secret"