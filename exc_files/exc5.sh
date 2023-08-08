#!/bin/bash


function rdm_num_upto100 {
  echo $(( (RANDOM % 100) + 1 ))
}


declare -A matrix

matrix_size=$(rdm_num_upto100)


for (( i=0; i<matrix_size; i++ )); do

    for (( j=0; j<matrix_size; j++ )); do

         matrix[$i,$j]=$(rdm_num_upto100)

    done

done



for (( i=0; i<matrix_size; i++ )); do

    for (( j=0; j<matrix_size; j++ )); do

         printf "%3d" ${matrix[$i,$j]}

    done

    echo

done
