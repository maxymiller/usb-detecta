#!/bin/bash
maxyfile="usb-detecta-maxymiller.service"
systemctl disable $maxyfile
systemctl stop $maxyfile
rm -r /etc/systemd/system/$maxyfile
