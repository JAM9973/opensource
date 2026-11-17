#!/bin/bash

for i in 1 2
do
    read -r -p "$i 번째 x 값: " x
    awk -v x="$x" 'BEGIN { print "y =", x * x / 2 }'
done
