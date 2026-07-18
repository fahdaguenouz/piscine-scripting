#!/bin/bash
if [ "$#" -ne 1 ]; then
    >&2 echo "Error: wrong argument"
    exit 1
fi

case "$1" in
    ''|*[!0-9]*)
        >&2 echo "Error: wrong argument"
        exit 1
        ;;
esac

if [ "$1" -lt 1 ] || [ "$1" -gt 100 ]; then
    >&2 echo "Error: wrong argument"
    exit 1
fi

secret=$1

for ((tries=1; tries<=5; )); do
    tries_left=$((6 - tries))

    echo "Enter your guess ($tries_left tries left):"
    read guess

    # Invalid input: empty, non-numeric, or outside 1-100
    if ! [[ $guess =~ ^[0-9]+$ ]] || [ "$guess" -lt 1 ] || [ "$guess" -gt 100 ]; then
        continue
    fi

    if [ "$guess" -lt "$secret" ]; then
        echo "Go up"
    elif [ "$guess" -gt "$secret" ]; then
        echo "Go down"
    else
        echo "Congratulations, you found the number in $tries moves!"
        exit 0
    fi

    tries=$((tries + 1))
done

echo "You lost, the number was $secret"