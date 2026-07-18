#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Error: expect 1 argument only!" >&2
  exit 1
fi

students=$1

declare -a names
declare -a grades

for ((i=1; i<=students; i++)); do
  read -p "Student Name #${i}: " name
  read -p "Student Grade #${i}: " grade

  if ! [[ "$grade" =~ ^[0-9]+$ ]] || [ "$grade" -gt 100 ]; then
    echo "Error: The grade '$grade' is not a valid input. Only numerical grades between 0 and 100 are accepted." >&2
    exit 1
  fi

  names+=("$name")
  grades+=("$grade")
done

for ((i=0; i<students; i++)); do
  if [ "${grades[$i]}" -ge 90 ]; then
    echo "${names[$i]}: You did an excellent job!"
  elif [ "${grades[$i]}" -ge 70 ]; then
    echo "${names[$i]}: You did a good job!"
  elif [ "${grades[$i]}" -ge 50 ]; then
    echo "${names[$i]}: You need a bit more effort!"
  else
    echo "${names[$i]}: You had a poor performance!"
  fi
done