# usb-detecta
e um código conectar o usb automático e Executar automático
- app `gnome-terminal (Terminal do GNOME)`
- comando `findmnt` `whiptail`

http://youtu.be/QOYoQgEtQ2Q?si=PM4BpQHZts3wltc

```
chmod u+x auto-mount.sh mount.sh list.sh mountusb.sh usb-detecta.sh
```

start.sh
-
- aquivos `menu.yml` `title.yml` `list.yml` `start.sh` criar do usb
- `exec` executar e fechar depois fim do processo, eu não sei usar mais e isso
- ex.

```
#!/bin/bash
maxypasta="$2"
maxydev="$3"
maxyvlc="-f --play-and-exit --no-video-title-show"
case "$1" in
	#<valor>) <executar e fechar depois fim do processo, ou sem> <comando> <valor do comando> "<aquivo 1>" "<aquivo 2>"; <mais comando ou não>;;
	1) exec vlc $maxyvlc "$maxypasta/1.mp4";;
	2) exec vlc $maxyvlc "$maxypasta/2.mp4";;
esac
```

- funciona
```
#!/bin/bash
maxypasta="$2"
maxydev="$3"
maxyvlc="-f --play-and-exit --no-video-title-show"
case "$1" in
	1) vlc $maxyvlc "$maxypasta/1.mp4"
	exec echo "fim";;

	2) vlc $maxyvlc "$maxypasta/2.mp4"
	exec echo "fim";;

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
