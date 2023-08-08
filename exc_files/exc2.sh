#!/bin/bash

validate_file(){
   if [ ! -e "$1" ]; then
     echo "ERROR:file not found"
     exit 1
   fi
}

main(){
   file="$1"
   validate_file "$file"
   seporater="$2"
   str=$(cat "$file")
   IFS="$seporater" read -ra arr <<< "$str"
   counter=0
   for feild in "${arr[@]}";
   do
      echo "feild $counter : '$feild'"
      ((counter+=1))
   done
}

main "$@"


