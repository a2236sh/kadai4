#!/bin/bash

if [ $# != 2 ]; then
  echo 'error:引数の数が正しくありません。2つの自然数を引数に設定してください'
  exit 1
fi

if [[ "$1" =~ ^[0]+ ]];then
  echo "error:0埋めの数字はセットできません。引数には自然数を設定してください"
  exit 1
fi

if [[ "$2" =~ ^[0]+ ]];then
  echo "error:0埋めの数字はセットできません。引数には自然数を設定してください"
  exit 1
fi

if ! [[ "$1" =~ ^[0-9]+$ ]];then
  echo "error:第一引数に利用できない値がセットされています。引数には自然数を設定してください"
  exit 1
fi

if ! [[ "$2" =~ ^[0-9]+$ ]];then
  echo "error:第二引数に利用できない値がセットされています。引数には自然数を設定してください"
  exit 1
fi

greatest_common_divisor () {
  if [ $2 -eq 0 ]; then
    echo $1
  else
    echo `greatest_common_divisor $2 $(( $1 % $2 ))`
  fi
}

greatest_common_divisor $1 $2
exit 0
