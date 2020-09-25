#!/bin/sh

root_folder="$1"
answer_file_name="$2"

ls $root_folder | while read LINE
do
    echo "$root_folder/$LINE/$answer_file_name"
    gcc "$root_folder/$LINE/$answer_file_name" && cat ./${answer_file_name%.*}/input.txt | ./a.out && rm a.out
done