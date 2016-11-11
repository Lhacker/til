h1. Network command in initial Centos7
Ref: http://qiita.com/tamamius/items/a27fa04a4c978479b395
```sh
nmcli d show
nmcli con show eth0

nmcli con mod connection.autoconnect yes
nmcli device disconnect eth0; nmcli device connect eth0

ping 8.8.8.8
```
