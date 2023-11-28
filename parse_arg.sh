#!/bin/bash

parameters=`getopt -o ab:c:: --long add:,remove::,show -n "$0" -- "$@"`

[ $? != 0 ] && exit 1

eval set -- "$parameters"   # 将$parameters设置为位置参数
while true ; do             # 循环解析位置参数
    case "$1" in
        -a|--longa) ...;shift ;;    # 不带参数的选项-a或--longa
        -b|--longb) ...;shift 2;;   # 带参数的选项-b或--longb
        -c|--longc)                 # 参数可选的选项-c或--longc
            case "$2" in
                "")...;shift 2;;  # 没有给可选参数
                *) ...;shift 2;;  # 给了可选参数
            esac;;
        --) ...; break ;;       # 开始解析非选项类型的参数，break后，它们都保留在$@中
        *) echo "wrong";exit 1;;
    esac
done

