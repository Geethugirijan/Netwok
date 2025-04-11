#!/bin/bash
read -p "enter the starting range: " start
read -p "enter the ending range: " end
echo "even numbers from $start to $end:"
for ((i=$start; i<=$end; i++))
do 
if (( i%2==0 )); then
	echo $i
fi
done
