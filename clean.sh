clear
rm -rfv "$(pwd)/build.log"
rm -rfv "$(pwd)/uImage"
rm -rfv "$(pwd)/system"
make -C "$(pwd)/am1808/DaVinci-PSP-SDK-03.20.00.13/src/kernel/linux-03.20.00.13/" -j$(nproc --all) ARCH="arm" CROSS_COMPILE="$(pwd)/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-" INSTALL_MOD_PATH="$(pwd)/system/" clean
make -C "$(pwd)/am1808/DaVinci-PSP-SDK-03.20.00.13/src/kernel/linux-03.20.00.13/" -j$(nproc --all) ARCH="arm" CROSS_COMPILE="$(pwd)/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-" INSTALL_MOD_PATH="$(pwd)/system/" distclean
make -C "$(pwd)/am1808/DaVinci-PSP-SDK-03.20.00.13/src/kernel/linux-03.20.00.13/" -j$(nproc --all) ARCH="arm" CROSS_COMPILE="$(pwd)/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-" INSTALL_MOD_PATH="$(pwd)/system/" mrproper
for a in d_analog d_bt d_iic d_power d_pwm d_sound d_uart d_ui d_usbdev d_usbhost
do
echo $a
make -j$(nproc --all) ARCH="arm" CROSS_COMPILE="$(pwd)/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-" M="$(pwd)/projects/lms2012/$a/Linuxmod_AM1808/" MOD="$a" -C "$(pwd)/am1808/DaVinci-PSP-SDK-03.20.00.13/src/kernel/linux-03.20.00.13/" INSTALL_MOD_PATH="$(pwd)/system/" clean
done
