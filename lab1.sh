#!/bin/bash

SEPARATOR=$(printf "%.0=" {1..40})

info_enter() {
    echo
    read -p "Для продолжения нажмите Enter"
}

current_dir() {
    echo "Текущий рабочий каталог:"
    pwd
}

current_process() {
    echo "Текущий запущенный процесс:"
    ps -p $$
}

home_dir() {
    echo "Домашний каталог:"
    echo $HOME
}

os_info() {
    echo "Название и версия операционной системы:"
    cat /etc/os-release
}

shells() {
    echo "Доступные оболочки в вашей системе:"
    cat /etc/shells
}

users() {
    echo "Пользователи в системе:"
    who
}

users_count() {
    echo "Количество пользователей:"
    who | wc -l
}

disks() {
    echo "Информация о жестких дисках:"
    lsblk
}

cpu() {
    echo "Информация о процессоре:"
    lscpu
}

memory() {
    echo "Информация о памяти:"
    free -h
}

filesystem() {
    echo "Информация о файловой системе:"
    df -h
}

packages() {
    echo "Информация об установленных пакетах ПО:"
    dpkg -l
}

all_info() {
    current_dir
    echo $SEPARATOR
    current_process
    echo $SEPARATOR
    home_dir
    echo $SEPARATOR
    os_info
    echo $SEPARATOR
    shells
    echo $SEPARATOR
    users
    echo $SEPARATOR
    users_count
    echo $SEPARATOR
    disks
    echo $SEPARATOR
    cpu
    echo $SEPARATOR
    memory
    echo $SEPARATOR
    filesystem
    echo $SEPARATOR
    packages
}

if [[ "$1" == "--tofile" && -n "$2" ]]; then
    all_info > "$2"
    echo "Информация записана в файл $2"
    exit 0
fi

while true; do
    clear
    echo "Меню:"
    echo "1) Текущий рабочий каталог"
    echo "2) Текущий запущенный процесс"
    echo "3) Домашний каталог"
    echo "4) Название и версия операционной системы"
    echo "5) Доступные оболочки в вашей системе"
    echo "6) Пользователи в системе"
    echo "7) Количество пользователей"
    echo "8) Жесткие диски"
    echo "9) Процессор"
    echo "10) Память"
    echo "11) Файловая система"
    echo "12) Информация об установленных пакетах ПО"
    echo "13) Показать ВСЮ информацию"
    echo "0) Выход"
    echo
    read -p "Выберите пункт: " choice

    clear
    case $choice in
        1) current_dir ;;
        2) current_process ;;
        3) home_dir ;;
        4) os_info ;;
        5) shells ;;
        6) users ;;
        7) users_count ;;
        8) disks ;;
        9) cpu ;;
        10) memory ;;
        11) filesystem ;;
        12) packages ;;
        13) all_info ;;
        0) exit 0 ;;
        *) echo "Неверный выбор" ;;
    esac

    info_enter
done
