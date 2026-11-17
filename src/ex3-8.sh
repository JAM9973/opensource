#!/bin/bash

echo "1) 기존 기록에 추가"
echo "2) 처음부터 다시 작성"
read -r -p "메뉴 선택: " menu || exit 1

case "$menu" in
    1|2)
        read -r -p "이름: " name || exit 1
        read -r -p "생일(MM-DD): " birthday || exit 1

        if [[ -z "$name" || -z "$birthday" ]]; then
            echo "이름과 생일을 모두 입력하세요."
            exit 1
        fi

        if [[ "$menu" == "1" ]]; then
            printf '%s\t%s\n' "$name" "$birthday" >> DB.txt || exit 1
        else
            printf '%s\t%s\n' "$name" "$birthday" > DB.txt || exit 1
        fi

        echo "DB.txt에 저장된 내용"
        cat DB.txt
        ;;
    *)
        echo "1 또는 2를 선택하세요."
        ;;
esac
