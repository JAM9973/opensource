#!/bin/bash

read -r -p "폴더 이름: " folder

if [[ -z "$folder" ]]; then
    echo "폴더 이름을 입력하세요."
    exit 1
fi

mkdir -p -- "$folder" || exit 1
cd -- "$folder" || exit 1

for i in 1 2 3 4 5
do
    name="file$i"
    file="$name.txt"

    touch "$file" || exit 1
    mkdir -p "$name" || exit 1
    ln -s "../$file" "$name/$file" || exit 1

    ls -l "$name/$file"
done
