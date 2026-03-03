#!/system/bin/sh
/system/bin/dmesg 2>&1 | /system/bin/cat >> /data/dmesg.log
/system/bin/dmesg -c
