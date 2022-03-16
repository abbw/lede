#!/bin/sh

# 提交时通过git add .添加所有文件，然后调用large_file_git_add.sh添加生成的小文件, git rm删除原始大文件

for filename in `cat large_file.list`
do
    echo git add ${filename}.*
    git add ${filename}.*
    echo git rm ${filename}
    git rm -f --ignore-unmatch ${filename}
done
