#!/bin/bash

rm -fr downloaded/*.tmp
rm -fr downloaded/*.tmp1
rm -fr downloaded/*.processed

FILES=downloaded/*.extracted

for f in $FILES
do
  echo "Processing $f"
  if [ -s $f ]; then
    cp $f $f.tmp
    sed -i 's/\o00//g' $f.tmp
    sed -i 's/&#[0-9]{4};//g' $f.tmp
    sed -i 's/&nbsp;//g' $f.tmp
    sed -i 's/&amp;//g' $f.tmp
    sed -i 's/[a-zA-Z]*//g' $f.tmp
    sed -i 's/\.\.//g' $f.tmp
    sed -i 's/\.\.\.//g' $f.tmp
    sed -i 's/[!]*//g' $f.tmp
    sed -i 's/[0-9]*//g' $f.tmp
    sed -i 's/[,|:-]//g' $f.tmp
    sed -i 's/[()]/ /g' $f.tmp
    sed -i 's/@//g' $f.tmp
    sed -i 's/%//g' $f.tmp
    sed -i 's/?//g' $f.tmp
    sed -i 's/*//g' $f.tmp
    sed -i 's/\///g' $f.tmp
    sed -i 's/=//g' $f.tmp
    #sed -i 's/[@%\?\*]*//g' $f.tmp
    sed -i "s/'//g" $f.tmp
    sed -i 's/"//g' $f.tmp
    sed -i 's/&#;//g' $f.tmp

    sed -i 's/\./\n/g' $f.tmp
    while read line
    do
      echo $line >> $f.tmp1
    done < $f.tmp
    cat $f.tmp1 | awk '{print "<s>", $0, "</s>"}' > $f.processed
    rm -fr $f.tmp
    rm -fr $f.tmp1
  else
    echo "$f is empty, skipping"
  fi
done



