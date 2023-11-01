#!/bin/bash

# tree -J --noreport -r --sort=name md > md.json

curdir=$(pwd)
cd ../public/articles/
outfile=articles.json
echo "[" > $outfile
first=1
grep "^image:" -ir md/* | awk -F: '{print "{\"mdfile\":\""$1"\",\"imgfile\":\""$3"\"}" }' | \
  sed 's/:" /:"/g' | sed 's/"md\//"/g' | sort -rn | while read line
do
    if [ $first -eq 1 ]
    then
        first=0
        echo "$line" >> $outfile
    else
        echo ",$line" >> $outfile
    fi
done
echo "]" >> $outfile
cat $outfile | jq
cd $curdir