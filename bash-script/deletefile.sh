#!/bin/bash

if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    echo "Использование: $0 [-p] <имя файла>"
    echo "  -p: использовать параметр как шаблон для удаления файлов"
    exit 1
fi

if [ "$1" == "-p" ]; then
    if [ -z "$2" ]; then
        echo "Ошибка: не указан шаблон для удаления."
        exit 1
    fi
    pattern="$2"
    
    files_found=false
    for file in *"$pattern"*; do
        if [ -f "$file" ]; then
            echo "Удаляем файл: \"$file\""
            rm "$file"
            files_found=true
        fi
    done
    if [ "$files_found" = false ]; then
        echo "Файлы не найдены по шаблону \"$pattern\""
        exit 1
    fi
else
    file_name="$1"
    if [ "$file_name" == "-p" ]; then
        echo "Ошибка: ожидалось имя файла, а не опция -p."
        exit 1  
    elif [ ! -f "$file_name" ]; then 
        echo "Файл \"$file_name\" не найден"
        exit 1
    else 
      echo "Удалён файл: \"$file_name\""
      rm "$file_name"
    fi
fi

