#!/bin/bash

file=/etc/netplan/99-remote-server.yaml
bkfile=/etc/netplan/99-remote-server.yaml.bak

# 引数チェック
if [ $# -ne 1 ]; then
  echo "usage: $0 [new address]"
  exit 1
fi

# ファイルバックアップ作成
cp $file $bkfile

# 変換処理
sed -i -e '/^ *enx04ab18f8625c:/,/^ *nameservers:/ s/^ *#*/    /; /^ *enx04ab18f8625c:/a\
      addresses: '"$1"'\
' "$file"
sed -i -e '8d' $file
sed -i -e '/gateway4:/s/^/#/' $file
sed -i -e '8d' $file

echo "${file}のファイルを書き換えました。"

cat $file
