#!/bin/bash


num_arr=("one" "two" "three" "four" "five" "six" "seven" "eight" "nine" "ten")

declare -A count_map

echo "Enter numbers between 1 and 10 (press Ctrl+D to finish):"



while read -r num; do

  for digit in $(echo "$num" | grep -o .); do

    if [[ "$digit" =~ ^[1-9]$|^10$ ]]; then

      if [[ -n "${count_map[$digit]}" ]]; then

        count_map[$digit]=$((count_map[$((digit))] + 1))

      else

        count_map[$digit]=1

      fi

    else

      echo "Invalid input: $digit (Ignoring)"

    fi

  done

done



echo "Number statistics:"



for num in "${!count_map[@]}"; do

  word="${num_arr[$((num-1))]}"

  count="${count_map[$num]}"

  echo "$word appeared $count times"

done
