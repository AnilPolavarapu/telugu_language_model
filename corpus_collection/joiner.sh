#!/bin/bash

FILES=downloaded/*.processed
OUTPUT=downloaded/input.txt

for f in $FILES
do
  if [ -s $f ]
  then
    cat $f | grep -v "<s>  </s>" >> $OUTPUT
  else
    echo "$f is empty, skipping"
  fi
done



