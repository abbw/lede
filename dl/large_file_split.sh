#!/bin/sh
for filename in `cat large_file.list`
do
	echo split ${filename}
	split -b 45M ${filename} ${filename}.
done
