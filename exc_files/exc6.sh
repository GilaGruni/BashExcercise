#!/bin/bash
file_name="/etc/passwd"

index=0
local i
declare -A USERS
while read line
do
  IFS=":" read -ra arr <<< "$line"
  for ((i=0;i<"${#arr[@]}";i++))
  do
    USERS["$index","$i"]="${arr[$i]}"
  done
  ((index++))
done < "$file_name"


for x in $(seq 1 $index)
do
  for j in $(seq 1 $i)
  do
    echo ${USERS[$x,$j]}
  done
  echo 
done
