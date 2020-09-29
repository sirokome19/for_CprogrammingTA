#!/bin/sh

root_folder="$1"
answer_file_name="$2"

answer=`cat ./${answer_file_name%.*}/answer.txt`
echo "$answer"

ls $root_folder | while read LINE
do
    var=`gcc "$root_folder/$LINE/$answer_file_name" && \
    cat ./${answer_file_name%.*}/input.txt | ./a.out && \
    rm a.out`
    if [ "$answer" != "$var" ] ; then
        echo "$root_folder/$LINE/$answer_file_name"
        echo "$var"
    fi
done