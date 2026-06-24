#!/usr/bin/env bash

read -p "Введите размер доски: " size

color1="\e[47m   \e[0m"
color2="\e[40m   \e[0m"

row_color=0

for ((i=0; i<size; i++)); do
    flag=$row_color

    for ((j=0; j<size; j++)); do
        if [ $flag -eq 0 ]; then
            echo -ne "$color1"
            flag=1
        else
            echo -ne "$color2"
            flag=0
        fi
    done

    echo

    if [ $row_color -eq 0 ]; then
        row_color=1
    else
        row_color=0
    fi
done