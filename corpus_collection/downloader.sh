#!/bin/bash

url_prefix="http://www.andhrajyothy.com/artical?SID="

rm -fr downloaded/*.html

#339000
for i in `seq 336000 338000`;
do
	echo "working on $url_prefix$i"
	wget $url_prefix$i -O downloaded/$i.html
	#wget --local-encoding=UTF-16 --remote-encoding=UTF-16 --restrict-file-names=nocontrol $url_prefix$i -O downloaded/$i.html
done
