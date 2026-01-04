#!/bin/bash
echo -e "[\e[32mINFO\e[0m] cp -r \"$PWD\" ~/usb-detecta-maxymiller"
cp -r "$PWD" ~/usb-detecta-maxymiller
echo -e "[\e[32mINFO\e[0m] cd ~/usb-detecta-maxymiller"
cd ~/usb-detecta-maxymiller
mv ./systemd/start.sh ./
chmod u+x ./systemd/systemd.sh ./systemd/install.sh ./systemd/autostart.sh
chmod u+x auto-mount.sh mount.sh list.sh mountusb.sh usb-detecta.sh start.sh uninstall.sh
sudo ./systemd/install.sh

echo -e "[\e[32mINFO\e[0m] usb (ex. b = /dev/sdb, c = /dev/sdc):"
read in
maxydevsd=$in
echo -e "[\e[32mINFO\e[0m] part (ex. 1 = /dev/sdb1, 2 = /dev/sdb2):"
read in
maxydevpart=$in

./systemd/autostart.sh $maxydevsd $maxydevpart
cp ./code-pc/usb-detecta-maxymiller.desktop ~/.config/autostart/
echo -e "[\e[32mINFO\e[0m] novo pasta: \"~/usb-detecta-maxymiller\""
echo -e "[\e[32mINFO\e[0m] uninstall: \"./uninstall.sh\" na pasta: \"~/usb-detecta-maxymiller\""
#echo -e "[\e[32mINFO\e[0m] criar novo do app: \"Aplicativos iniciais de sessão\" "
