#!/bin/sh

rm -f large_file.list
for filename in $(find . -type f | grep -v .git); do
    filesize=$(ls -l ${filename} | awk '{print $5}')
    if [ ${filesize} -gt 47185920 ]; then
        echo ${filename} >> large_file.list
        echo add ${filename} to large_file.list file
    fi
done