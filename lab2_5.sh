#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Нужно: директория расширение количество"
    exit 1
fi

directory="$1"
extension="$2"
topN="$3"

if [ ! -d "$directory" ]; then
    echo "Директория не существует"
    exit 1
fi

declare -A words

while IFS= read -r word; do
    ((words["$word"]++))
done < <(
    grep -rhoE "\w+" --include="*.$extension" "$directory" | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]'
)

for word in "${!words[@]}"; do
    echo "$word ${words[$word]}"
done | sort -k2 -nr | head -n "$topN" | awk '{print $1": "$2}'