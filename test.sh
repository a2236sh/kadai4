#!/bin/bash

is_expected () {
#  debugに利用。普段はコメントアウト
#  echo $1
#  echo $2
  if [ $1 = $2 ]; then
    echo 'passed.'
  else
    echo 'failed'
    exit 1
  fi
}

# 正常系テスト
echo "2つの引数を渡すと最大公約数が返ること(第二引数に大きな値)"
  result=`bash gcd.sh 5 25`
  expected=5
is_expected $result $expected


echo "2つの引数を渡すと最大公約数が返ること(第一引数に大きな値)"
  result=`bash gcd.sh 1708 36`
  expected=4
is_expected $result $expected


echo "2つの引数を渡すと最大公約数が返ること(同値を渡す)"
  result=`bash gcd.sh 15 15`
  expected=15
is_expected $result $expected


# 異常系テスト
echo "0で始まる数字を引数で渡すとエラーが返ること"
  result=`bash gcd.sh 005 025`
  expected='error:0埋めの数字はセットできません。引数には自然数を設定してください'
is_expected $result $expected


echo "引数の数が不足しているとエラーを返すこと"
  result=`bash gcd.sh 5`
  expected='error:引数の数が正しくありません。2つの自然数を引数に設定してください'
is_expected $result $expected


echo "引数の数が多いとエラーを返すこと"
  result=`bash gcd.sh 5 25 125`
  expected='error:引数の数が正しくありません。2つの自然数を引数に設定してください'
is_expected $result $expected


echo "引数に小数点を渡すとエラーを返すこと(第一引数)"
  result=`bash gcd.sh 1.5 25`
  expected='error:第一引数に利用できない値がセットされています。引数には自然数を設定してください'
is_expected $result $expected


echo "引数に小数点を渡すとエラーを返すこと(第二引数)"
  result=`bash gcd.sh 25 1.7`
  expected='error:第二引数に利用できない値がセットされています。引数には自然数を設定してください'
is_expected $result $expected


echo "引数にマイナスの数字渡すとエラーを返すこと(第一引数)"
  result=`bash gcd.sh -12 16`
  expected='error:第一引数に利用できない値がセットされています。引数には自然数を設定してください'
is_expected $result $expected


echo "引数にマイナスの数字渡すとエラーを返すこと(第二引数)"
  result=`bash gcd.sh 12 -16`
  expected='error:第二引数に利用できない値がセットされています。引数には自然数を設定してください'
is_expected $result $expected


echo "引数に数字以外を渡すとエラーを返すこと(第一引数)"
  result=`bash gcd.sh 'hoge' 16`
  expected='error:第一引数に利用できない値がセットされています。引数には自然数を設定してください'
is_expected $result $expected


echo "引数に数字以外を渡すとエラーを返すこと(第二引数)"
  result=`bash gcd.sh 12 'fuga'`
  expected='error:第二引数に利用できない値がセットされています。引数には自然数を設定してください'
is_expected $result $expected
