#!/bin/bash

if [ -z "$1" ]; then
    echo "Нужна директория"
    exit 1
fi

directory="$1"

if [ ! -d "$directory" ]; then
    echo "Директория не существует"
    exit 1
fi

dirname=$(basename "$directory")
date=$(date +%Y-%m-%d)
archive="${dirname}_${date}.tar.gz"

tar -czf "$archive" "$directory"

if [ $? -eq 0 ]; then
    echo "Архив создан"
else
    echo "Ошибка при создании архива"
    exit 1
fi

find . -name "${dirname}_*.tar.gz" -mtime +7 -delete

echo "Старые архивы удалены"