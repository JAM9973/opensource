#!/bin/bash

if [[ ! -f DB.txt ]]; then
    echo "DB.txt가 없습니다. 먼저 ex3-8.sh를 실행하세요."
    exit 1
fi

read -r -p "검색할 이름: " name || exit 1

if [[ -z "$name" ]]; then
    echo "이름을 입력하세요."
    exit 1
fi

awk -F '\t' -v name="$name" '
    $1 == name {
        print "이름:", $1
        print "생일:", $2
        found = 1
    }
    END {
        if (!found)
            print "등록된 이름이 없습니다."
    }
' DB.txt
