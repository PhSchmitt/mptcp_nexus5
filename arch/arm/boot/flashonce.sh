#!/bin/bash

cp ~/Downloads/Nexus\ 5/Nexus5\ MPTCP/boot.img .
abootimg -x boot.img bootimg.cfg zImage.old initrd.img
sed -i 1d bootimg.cfg
abootimg --create newboot.img -f bootimg.cfg -k zImage-dtb -r initrd.img
adb reboot bootloader
sleep 7s
fastboot boot -c "console=ttyHSL0,115200,n8 androidboot.hardware=hammerhead user_debug=31 maxcpus=2 msm_watchdog_v2.enable=1" newboot.img

