#!/bin/bash

read -r -p "폴더 이름: " folder

if [[ -z "$folder" ]]; then
    echo "폴더 이름을 입력하세요."
    exit 1
fi

if [[ -d "$folder" ]]; then
    echo "기존 폴더를 사용합니다: $folder"
else
    mkdir -- "$folder" || exit 1
    echo "폴더를 만들었습니다: $folder"
fi

cd -- "$folder" || exit 1

touch file1.txt file2.txt file3.txt file4.txt file5.txt || exit 1

tar -czf files.tar.gz file1.txt file2.txt file3.txt file4.txt file5.txt || exit 1
echo "압축 파일: files.tar.gz"

mkdir -p unpacked || exit 1
tar -xzf files.tar.gz -C unpacked || exit 1

echo "unpacked 폴더에 압축을 푼 파일 목록"
ls -1 unpacked
