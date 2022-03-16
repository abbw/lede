**问题：**

github仓库对普通账号的单个文件大小限制50MB

**解决方案：**

1、生成大于45MB大文件列表，写入到large_file.list

```sh
abbw@abbw:~/work/openwrt/dl$ ./large_file_list_gen.sh
add ./linux-5.4.154.tar.xz to large_file.list file
add ./gcc-8.4.0.tar.xz to large_file.list file
add ./linux-firmware-20201118.tar.xz to large_file.list file
```

2、将large_file.list内的大文件分割为小于45MB的多个文件，会生成FILENAME.aa FILENAME.ab等后缀的文件

```sh
abbw@abbw:~/work/openwrt/dl$ ./large_file_split.sh
split ./linux-5.4.154.tar.xz
split ./gcc-8.4.0.tar.xz
split ./linux-firmware-20201118.tar.xz
```

3、提交时通过git add .添加所有文件，然后调用large_file_git_add.sh添加生成的小文件, git rm删除原始大文件

```sh
abbw@abbw:~/work/openwrt/dl$ git add .
abbw@abbw:~/work/openwrt/dl$ ./large_file_git_add.sh
git add ./linux-5.4.154.tar.xz.aa ./linux-5.4.154.tar.xz.ab ./linux-5.4.154.tar.xz.ac
git rm ./linux-5.4.154.tar.xz
git add ./gcc-8.4.0.tar.xz.aa ./gcc-8.4.0.tar.xz.ab
git rm ./gcc-8.4.0.tar.xz
git add ./linux-firmware-20201118.tar.xz.aa ./linux-firmware-20201118.tar.xz.ab ./linux-firmware-20201118.tar.xz.ac
git rm ./linux-firmware-20201118.tar.xz
```

4、正常使用时合并小文件为大文件

```sh
abbw@abbw:~/work/openwrt/dl$ ./large_file_merge.sh
merge file ./linux-5.4.154.tar.xz
merge file ./gcc-8.4.0.tar.xz
merge file ./linux-firmware-20201118.tar.xz
```

**如何使用：**

```sh
git clone https://github.com/abbw/lede
cd dl
./large_file_merge.sh
```
