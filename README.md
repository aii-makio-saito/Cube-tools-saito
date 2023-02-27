# Wireguard 設定時　99-remote-server.yaml設定

### 使用方法
./setWireguardConf.sh [new_address]

### 設定
setWireguard.Conf.shを踏み台サーバに設置

### 実行権限付与
sudo chmod 777 setWireguard.Conf.sh

### 実行結果
 ./setWireguardConf.sh " - 111.222.333.445/22"
99-remote-server.yamlのファイルを書き換えました。
network:
  ethernets:
    eno1:
      dhcp4: true
      optional: true
    enx04ab18f8625c:
      addresses:  - [new_address]
    #gateway4: 10.151.31.1
    nameservers:
        addresses:
        - 8.8.8.8
        - 8.8.4.4
        search: []
  renderer: NetworkManager
  version: 2
                                                                       