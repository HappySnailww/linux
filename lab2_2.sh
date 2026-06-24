#!/bin/bash

dir="$1"

if [ -z "$dir" ]; then
    echo "Нужно ввести директорию"
    exit 1
fi

calc_size() {
    local target="$1"
    total=$(find "$target" \( -type f -o -type l \) -printf "%s\n" 2>/dev/null | awk '{sum+=$1} END {print sum}')
    echo "$total"
}

for sub in "$dir"/*; do
    if [ -d "$sub" ]; then
        size=$(calc_size "$sub")
        printf "%d B    %s\n" "$size" "$sub"
    fi
done

total=$(calc_size "$dir")
printf "%d B    %s\n" "$total" "$dir"