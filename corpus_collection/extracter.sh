#!/bin/bash

#start_tag="span id=\"ContentPlaceHolder1_lblStoryDetails\""
#end_tag="/span"

rm -fr downloaded/*.extracted

FILES=downloaded/*.html
for f in $FILES
do
  echo "Processing $f file"
  #awk -F'[<>]' -v taga="$start_tag" -v tagb="$end_tag" '{ i=1; while (i<=NF) { if ($(i)==taga && $(i+2)==tagb) { print $(i+1) }; i++} }' < $f > $f.extracted
  cat $f | sed -n 's:.*<span id=\"ContentPlaceHolder1_lblStoryDetails\">\(.*\)</span>.*:\1:p' | sed 's/<\/\?[^>]\+>//g' > $f.extracted
done

