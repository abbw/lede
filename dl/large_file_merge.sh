#!/bin/sh
for filename in `cat large_file.list`
do
	echo merge file ${filename}
	cat ${filename}.* > ${filename}
done
