#!/bin/sh
for filename in `cat large_file.list`
do
    echo git add ${filename}.*
    git add ${filename}.*
    echo git rm ${filename}
    git rm -f --ignore-unmatch ${filename}
done