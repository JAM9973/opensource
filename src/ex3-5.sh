#!/bin/bash

echo "==================="
echo "1) 사용자 정보"
echo "2) CPU 사용률 확인"
echo "3) 메모리 사용량 확인"
echo "4) 디스크 사용량 확인"
echo "==================="
read -r -p "메뉴 선택: " menu

case "$menu" in
    1)
        id
        ;;
    2)
        top -b -n 2 -d 1 | awk '/^%Cpu/ { line = $0 } END { print line }'
        ;;
    3)
        free -h
        ;;
    4)
        df -h /
        ;;
    *)
        echo "1부터 4까지 선택하세요."
        ;;
esac
