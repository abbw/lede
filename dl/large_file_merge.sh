#!/bin/sh

# 正常使用时合并小文件为大文件

for filename in `cat large_file.list`
do
	echo merge file ${filename}
	cat ${filename}.* > ${filename}
done
