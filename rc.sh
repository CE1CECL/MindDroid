echo 'on init' > ./init.mindstorms.rc
echo '    start insmod-sh' >> ./init.mindstorms.rc
echo 'service insmod-sh /system/bin/insmod.sh' >> ./init.mindstorms.rc
echo '    disabled' >> ./init.mindstorms.rc
echo '    oneshot' >> ./init.mindstorms.rc
echo 'on init' > ./init.mindstormsev3.rc
echo '    start insmod-sh' >> ./init.mindstormsev3.rc
echo 'service insmod-sh /system/bin/insmod.sh' >> ./init.mindstormsev3.rc
echo '    disabled' >> ./init.mindstormsev3.rc
echo '    oneshot' >> ./init.mindstormsev3.rc
echo '#!/system/bin/sh' > ./system/bin/insmod.sh
echo '/system/bin/insmod /system/lib/modules/2.6.33-rc4/extra/d_analog.ko' >> ./system/bin/insmod.sh
echo '/system/bin/insmod /system/lib/modules/2.6.33-rc4/extra/d_bt.ko' >> ./system/bin/insmod.sh
echo '/system/bin/insmod /system/lib/modules/2.6.33-rc4/extra/d_iic.ko' >> ./system/bin/insmod.sh
echo '/system/bin/insmod /system/lib/modules/2.6.33-rc4/extra/d_power.ko' >> ./system/bin/insmod.sh
echo '/system/bin/insmod /system/lib/modules/2.6.33-rc4/extra/d_pwm.ko' >> ./system/bin/insmod.sh
echo '/system/bin/insmod /system/lib/modules/2.6.33-rc4/extra/d_sound.ko' >> ./system/bin/insmod.sh
echo '/system/bin/insmod /system/lib/modules/2.6.33-rc4/extra/d_uart.ko' >> ./system/bin/insmod.sh
echo '/system/bin/insmod /system/lib/modules/2.6.33-rc4/extra/d_ui.ko' >> ./system/bin/insmod.sh
echo '/system/bin/insmod /system/lib/modules/2.6.33-rc4/extra/d_usbdev.ko' >> ./system/bin/insmod.sh
echo '/system/bin/insmod /system/lib/modules/2.6.33-rc4/extra/d_usbhost.ko' >> ./system/bin/insmod.sh
chown -v 0:0 ./init.mindstorms.rc
chmod -v 7777 ./init.mindstorms.rc
chown -v 0:0 ./init.mindstormsev3.rc
chmod -v 7777 ./init.mindstormsev3.rc
chown -v 0:0 ./system/bin/insmod.sh
chmod -v 7777 ./system/bin/insmod.sh
