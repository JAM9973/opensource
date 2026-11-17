#!/bin/bash

scores=()
total=0

while true
do
    echo "==================="
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급(GPA) 변환"
    echo "5) 종료"
    echo "==================="
    read -r -p "메뉴 선택: " menu || break

    count=${#scores[@]}

    case "$menu" in
        1)
            read -r -p "과목 점수: " score || break

            if [[ "$score" =~ ^([0-9]|[1-9][0-9]|100)$ ]]; then
                scores+=("$score")
                total=$((total + score))
                echo "점수를 추가했습니다."
            else
                echo "0부터 100까지의 정수를 입력하세요."
            fi
            ;;
        2)
            if (( count == 0 )); then
                echo "입력된 점수가 없습니다."
            else
                echo "입력된 점수: ${scores[*]}"
            fi
            ;;
        3)
            if (( count == 0 )); then
                echo "입력된 점수가 없습니다."
            else
                awk -v total="$total" -v count="$count" \
                    'BEGIN { print "평균 점수:", total / count }'
            fi
            ;;
        4)
            if (( count == 0 )); then
                echo "입력된 점수가 없습니다."
            elif (( total >= 90 * count )); then
                echo "평균 등급: A"
            else
                echo "평균 등급: B"
            fi
            ;;
        5)
            echo "프로그램을 종료합니다."
            break
            ;;
        *)
            echo "1부터 5까지 선택하세요."
            ;;
    esac

    echo
done
