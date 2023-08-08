#!/bin/bash


#A function that will validate that useres input is greater then 2
validate_arguments(){
   if [ "$#" -lt 2 ];then
      echo "USAGE: 0 TARGET_DIRECTORY IMAGE_URL"
      exit 1
   fi
}

#A func that validates the directory the user whants to use for saving the downloadid images
validate_dir(){
   if [ ! -d "$1" ];then
     echo "ERROR: Target directory was not found or it is not a directory"
     echo "$1"
     exit 1
   fi
}

#Handles the images downloading
handle_downloading(){
    targit_dir="$1"
    #extracts the dir(first arg) from my args
    shift
    #loops throw all users url
    for url in "$@";do
      #checks if url is in the right format
      if ! [[ "$url" =~ ^https?:// ]];then
         echo "ERROR:Invalid url format for '$url'"
         exit 1
     fi
     file_name=$(basename "$url")
     #dowloads and checks if dowload successfolly
     if ! wget -q "$url" -P "$targit_dir";then
        echo "ERROR:Failed to download image from '$url' to '$targit_dir'"
        exit 1
     fi
    done 
}

#Hndles the zip dowload
handle_zip(){
    time_stamp=$(date +"%Y%m%d_%H%M%S")
    name="iamges_$time_stamp.zip"
    #dowloades all files  targit_dir 
    zip -q -J "$name" "${targit_dir}"/*
    echo "dowloadid zip"
}

#will call all funcs in order
main(){
   validate_arguments "$@"
   targit_dir="$1"
   validate_dir "$targit_dir"
   shift
   handle_downloading "$targit_dir" "$@"
   handle_zip "$targit_dir"
}

main "$@" 


