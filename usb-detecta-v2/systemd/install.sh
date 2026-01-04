#!/bin/bash
maxyfile="usb-detecta-maxymiller.service"
./systemd/systemd.sh "$maxyfile"
cp "./code-pc/$maxyfile" /etc/systemd/system/
systemctl daemon-reload
systemctl enable $maxyfile
systemctl start $maxyfile
#systemctl status $maxyfile
