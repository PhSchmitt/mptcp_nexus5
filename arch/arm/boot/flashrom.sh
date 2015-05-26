#!/bin/bash

cp ~/Downloads/Nexus\ 5/Nexus5\ MPTCP/boot.img .
abootimg -x boot.img
sed -i 1d bootimg.cfg
abootimg --create newboot.img -f bootimg.cfg -k zImage -r initrd.img
adb reboot bootloader
sleep 7s
fastboot flash boot newboot.img
sleep 2s
fastboot reboot
