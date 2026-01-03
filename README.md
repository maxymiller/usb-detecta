# usb-detecta
e um código conectar o usb automático e Executar automático

http://youtu.be/QOYoQgEtQ2Q?si=PM4BpQHZts3wltc

```
chmod u+x auto-mount.sh mount.sh list.sh mountusb.sh usb-detecta.sh
```

start.sh
-
- aquivos `menu.yml` `title.yml` `list.yml` `start.sh` criar do usb 
- ex.

```
#!/bin/bash
maxypasta="$2"
maxydev="$3"
case "$1" in
	1) exec vlc "$maxypasta/<aquivo>";;
esac
```

iniciar
-
- `auto-mount.sh` root
- `mount` `mkdir` `udisksctl power-off -b` `umount`
```
sudo ./auto-mount.sh
```
- `usb-detecta.sh` app não funciona no root
- `./usb-detecta.sh` `b` `1`
- ex. (`b` = `/dev/sdb`, `c` = `/dev/sdc`)
- ex. (`1` = `/dev/sdb1`, `2` = `/dev/sdb2`)
```
./usb-detecta.sh
```
