#!/bin/bash  



function turn_to_ascii(){

 if [[ -z "$1" ]]; then

  echo "Enter a string:"

  read user_input

 else

  user_input="$1"

 fi

 for((i=0; i<${#user_input}; i++)); do

    letter=${user_input:i:1}

    ascii_value=$(printf "%d" "'$letter'")

    echo "$letter = $ascii_value"

    done

}



turn_to_ascii "$@"
