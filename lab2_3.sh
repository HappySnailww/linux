#!/bin/bash

if [ -z "$1" ]; then
  echo "Нужен путь к папке"
  exit 1
fi

directory="$1"

if [ ! -d "$directory" ]; then
  echo "Папка не существует"
  exit 1
fi

for file in "$directory"/*; do

  if [ -f "$file" ]; then
    filename=$(basename "$file")

    if [[ "$filename" == *.* ]]; then
      extension="${filename##*.}"
    else
      extension="no_extension"
    fi

    mkdir -p "$directory/$extension"
    mv "$file" "$directory/$extension/"
  fi

done