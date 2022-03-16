#!/bin/sh

# 将large_file.list内的大文件分割为小于45MB的多个文件，会生成FILENAME.aa FILENAME.ab等后缀的文件

for filename in `cat large_file.list`
do
	echo split ${filename}
	split -b 45M ${filename} ${filename}.
done
