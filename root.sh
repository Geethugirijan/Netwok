#!/bin/bash


read -p "Enter coefficient a: " a
read -p "Enter coefficient b: " b
read -p "Enter coefficient c: " c
if [ "$a" -eq 0 ]; then
    echo "Coefficient 'a' cannot be zero in a quadratic equation."
    exit 1
fi
discriminant=$((b * b - 4 * a * c))
if [ "$discriminant" -gt 0 ]; then
    root1=$(echo "scale=4; (-$b + sqrt($discriminant)) / (2 * $a)" | bc -l)
    root2=$(echo "scale=4; (-$b - sqrt($discriminant)) / (2 * $a)" | bc -l)
    echo "The roots are real and different."
    echo "Root 1: $root1"
    echo "Root 2: $root2"
elif [ "$discriminant" -eq 0 ]; then
    root=$(echo "scale=4; -$b / (2 * $a)" | bc -l)
    echo "The root is real and repeated."
    echo "Root: $root"
else
    realPart=$(echo "scale=4; -$b / (2 * $a)" | bc -l)
    imaginaryPart=$(echo "scale=4; sqrt(-$discriminant) / (2 * $a)" | bc -l)
    echo "The roots are complex and different."
    echo "Root 1: $realPart + ${imaginaryPart}i"
    echo "Root 2: $realPart - ${imaginaryPart}i"
fi
