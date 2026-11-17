#!/bin/bash

read -r -p "첫 번째 과목 점수: " score1
read -r -p "두 번째 과목 점수: " score2

if (( score1 < 0 || score1 > 100 || score2 < 0 || score2 > 100 )); then
    echo "점수는 0부터 100까지 입력하세요."
    exit 1
fi

if (( score1 >= 90 )); then
    echo "첫 번째 과목 등급: A"
else
    echo "첫 번째 과목 등급: B"
fi

if (( score2 >= 90 )); then
    echo "두 번째 과목 등급: A"
else
    echo "두 번째 과목 등급: B"
fi

awk -v a="$score1" -v b="$score2" 'BEGIN {
    average = (a + b) / 2
    print "평균 점수:", average

    if (average >= 90)
        print "평균 등급: A"
    else
        print "평균 등급: B"
}'
