#!/bin/bash

# 引数チェック
if [ $# -ne 1 ]; then
    echo "Usage: $0 [new_address]"
    exit 1
fi

# 対象ファイルのパス
file_path="/Users/saitoumakio/Documents/GitHub/Cube-tools-saito/99-remote-server.yaml"

# gateway4コメント化の制御
if grep -q "^[[:blank:]]*#*gateway4:" "$file_path"; then
    if grep -q "^[[:blank:]]*gateway4:" "$file_path"; then
        sed -i'.bak' 's/gateway4:/#&/' "$file_path"
    fi
else
    if grep -q "^[[:blank:]]*gateway4:" "$file_path"; then
        sed -i'.bak' 's/#*gateway4:/&/' "$file_path"
    else
        sed -i'.bak' '8 a #gateway4: ' "$file_path"
    fi
fi

# 8行目のaddressesを変更する
if grep -q "^[[:blank:]]*addresses:" "$file_path"; then
    sed -i'.bak' "8 s|.*|        - $1|" "$file_path"
fi
rm "${file_path}.bak"
