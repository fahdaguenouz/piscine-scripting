#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Error: expect 2 arguments" >&2
  exit 1
fi

flag=$1
username=$2
user_info=$(getent passwd "$username")

case "$flag" in
  -e)
    if [ -n "$user_info" ]; then
      echo "yes"
    else
      echo "no"
    fi
    ;;
  -i)
    if [ -n "$user_info" ]; then
      echo "$user_info"
    else
      echo
    fi
    ;;
  *)
    echo "Error: unknown flag" >&2
    exit 1
    ;;
esac