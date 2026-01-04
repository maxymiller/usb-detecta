#!/bin/bash
maxyfile="usb-detecta-maxymiller.desktop"
cd code-pc
echo '[Desktop Entry]' > "$maxyfile"
echo 'Type=Application' >> "$maxyfile"
echo "Exec=/home/$USER/usb-detecta-maxymiller/start.sh \"$1\" \"$2\"" >> "$maxyfile"
echo 'Hidden=false' >> "$maxyfile"
echo 'NoDisplay=false' >> "$maxyfile"
echo 'X-GNOME-Autostart-enabled=true' >> "$maxyfile"
echo 'Name[pt_BR]=usb-detecta-maxymiller' >> "$maxyfile"
echo 'Name=usb-detecta-maxymiller' >> "$maxyfile"
echo 'Comment[pt_BR]=auto start usb-detecta.sh' >> "$maxyfile"
echo 'Comment=auto start' >> "$maxyfile"
