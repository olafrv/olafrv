#!/bin/bash

echo "MD images not reference in MD articles:"
find ../public/blog/img -type f | xargs -n1 basename | while read file
do
    if ! grep -ir "$file" ../public/blog/md/* > /dev/null
    then 
        find .. -name "$file"
    fi 
done

echo "Files in /wordpress not referenced in MD articles:"
find ../public/wordpress -type f | xargs -n1 basename | while read file
do
    if ! grep -ir "$file" ../public/blog/md/* > /dev/null
    then 
        find .. -name "$file"
    fi 
done

echo "Global images not referenced in Vue source files:"
find ../public/img -type f | xargs -n1 basename | while read file
do
    if ! grep -ir "$file" ../src/* > /dev/null
    then 
        find .. -name "$file"
    fi 
done
