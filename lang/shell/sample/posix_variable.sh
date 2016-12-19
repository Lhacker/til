#!/bin/sh

echo "replace default value : "
echo ${val1:-aa}
echo $val1
val1=hoge
echo "${val1:-aa}\n"

echo "assign default value : "
val1=
echo ${val1:=aa}
echo $val1
echo ${val1:=fuga}
echo "$val1\n"

echo "check assignment && raise error : "
val1=
#echo "${val1:?value is not set}"
val1=hoge
echo "${val1:?value is not set}\n"

echo "replace another value : "
val1=
echo ${val1:+aa}
val1=hoge
echo "${val1:+aa}\n"

echo "get word length : "
val1=
echo "$val1 => ${#val1}"
val1=hoge
echo "$val1 => ${#val1}\n"

echo "remove bottom-min-match : "
val1=/foo/bar/baz
echo ${val1%/*}
val1=foo.c.bak
echo "${val1%.*}\n"

echo "remove bottom-max-match : "
val1=/foo/bar/baz
echo ${val1%%/*}
val1=foo.c.bak
echo "${val1%%.*}\n"

echo "remove top-min-match : "
val1=/foo/bar/baz
echo ${val1#*/}
val1=foo.c.bak
echo "${val1#*.}\n"

echo "remove top-max-match : "
val1=/foo/bar/baz
echo ${val1##*/}
val1=foo.c.bak
echo "${val1##*.}\n"
