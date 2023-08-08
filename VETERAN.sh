#!/bin/bash


main(){ 
  flag=$1
  shift
  case $flag in
    -[1-6])
        script_number="${flag:1}"
        script_path="./exc_files/exc$script_number.sh"
        if [ -f "$script_path" ]; then
            echo "Running Exercise $script_number script..."
            ./exc_files/exc$script_number.sh "$@" #runs the wanted script and sends the agrs
        else
            echo "Exercise $script_number script not found."
        fi
        ;;
    *)
        echo "Invalid flag. Please enter a flag in the format -[1-6]."
        ;;
esac
}

main "$@"


