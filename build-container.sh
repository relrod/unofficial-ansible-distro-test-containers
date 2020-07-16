#!/usr/bin/env bash

if [[ ! -d "$1" ]]; then
  echo "You must specify which container to build"
  exit 1
fi

name="$(basename "$1")"

docker build -t "ansible-$name" "$name"
