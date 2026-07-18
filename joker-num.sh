#!/bin/bash

if [ "$#" -ne 1 ] || ! [[ "$1" =~ ^[0-9]+$ ]] || [ "$1" -lt 1 ] || [ "$1" -gt 100 ]; then
  echo "Error: wrong argument"
  exit 1
fi

secret=$1

for ((try=1; try<=5; )); do
  tries_left=$((6 - try))
  echo "Enter your guess (${tries_left} tries left):"
  read guess

  if ! [[ "$guess" =~ ^[0-9]+$ ]] || [ -z "$guess" ] || [ "$guess" -lt 1 ] || [ "$guess" -gt 100 ]; then
    continue
  fi

  if [ "$guess" -gt "$secret" ]; then
    echo "Go down"
  elif [ "$guess" -lt "$secret" ]; then
    echo "Go up"
  else
    echo "Congratulations, you found the number in ${try} moves!"
    exit 0
  fi

  try=$((try + 1))
done

echo "You lost, the number was ${secret}"