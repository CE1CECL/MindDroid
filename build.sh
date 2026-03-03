clear
rm -rfv "$(pwd)/build.log"
rm -rfv "$(pwd)/uImage" 2>&1 | tee -a "$(pwd)/build.log"
rm -rfv "$(pwd)/system" 2>&1 | tee -a "$(pwd)/build.log"
make -C "$(pwd)/am1808/DaVinci-PSP-SDK-03.20.00.13/src/kernel/linux-03.20.00.13/" -j$(nproc --all) ARCH="arm" CROSS_COMPILE="$(pwd)/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-" INSTALL_MOD_PATH="$(pwd)/system/" clean 2>&1 | tee -a "$(pwd)/build.log"
make -C "$(pwd)/am1808/DaVinci-PSP-SDK-03.20.00.13/src/kernel/linux-03.20.00.13/" -j$(nproc --all) ARCH="arm" CROSS_COMPILE="$(pwd)/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-" INSTALL_MOD_PATH="$(pwd)/system/" distclean 2>&1 | tee -a "$(pwd)/build.log"
make -C "$(pwd)/am1808/DaVinci-PSP-SDK-03.20.00.13/src/kernel/linux-03.20.00.13/" -j$(nproc --all) ARCH="arm" CROSS_COMPILE="$(pwd)/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-" INSTALL_MOD_PATH="$(pwd)/system/" mrproper 2>&1 | tee -a "$(pwd)/build.log"
for a in d_analog d_bt d_iic d_power d_pwm d_sound d_uart d_ui d_usbdev d_usbhost
do
echo $a 2>&1 | tee -a "$(pwd)/build.log"
make -j$(nproc --all) ARCH="arm" CROSS_COMPILE="$(pwd)/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-" M="$(pwd)/projects/lms2012/$a/Linuxmod_AM1808/" MOD="$a" -C "$(pwd)/am1808/DaVinci-PSP-SDK-03.20.00.13/src/kernel/linux-03.20.00.13/" INSTALL_MOD_PATH="$(pwd)/system/" clean 2>&1 | tee -a "$(pwd)/build.log"
done
cp -rfv "$(pwd)/config" "$(pwd)/am1808/DaVinci-PSP-SDK-03.20.00.13/src/kernel/linux-03.20.00.13/.config"
make -C "$(pwd)/am1808/DaVinci-PSP-SDK-03.20.00.13/src/kernel/linux-03.20.00.13/" -j$(nproc --all) ARCH="arm" CROSS_COMPILE="$(pwd)/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-" INSTALL_MOD_PATH="$(pwd)/system/" prepare 2>&1 | tee -a "$(pwd)/build.log"
make -C "$(pwd)/am1808/DaVinci-PSP-SDK-03.20.00.13/src/kernel/linux-03.20.00.13/" -j$(nproc --all) ARCH="arm" CROSS_COMPILE="$(pwd)/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-" INSTALL_MOD_PATH="$(pwd)/system/" modules_prepare 2>&1 | tee -a "$(pwd)/build.log"
make -C "$(pwd)/am1808/DaVinci-PSP-SDK-03.20.00.13/src/kernel/linux-03.20.00.13/" -j$(nproc --all) ARCH="arm" CROSS_COMPILE="$(pwd)/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-" INSTALL_MOD_PATH="$(pwd)/system/" modules 2>&1 | tee -a "$(pwd)/build.log"
make -C "$(pwd)/am1808/DaVinci-PSP-SDK-03.20.00.13/src/kernel/linux-03.20.00.13/" -j$(nproc --all) ARCH="arm" CROSS_COMPILE="$(pwd)/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-" INSTALL_MOD_PATH="$(pwd)/system/" modules_install 2>&1 | tee -a "$(pwd)/build.log"
make -C "$(pwd)/am1808/DaVinci-PSP-SDK-03.20.00.13/src/kernel/linux-03.20.00.13/" -j$(nproc --all) ARCH="arm" CROSS_COMPILE="$(pwd)/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-" INSTALL_MOD_PATH="$(pwd)/system/" uImage 2>&1 | tee -a "$(pwd)/build.log"
for a in d_analog d_bt d_iic d_power d_pwm d_sound d_uart d_ui d_usbdev d_usbhost
do
echo $a 2>&1 | tee -a "$(pwd)/build.log"
make -j$(nproc --all) ARCH="arm" CROSS_COMPILE="$(pwd)/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-" M="$(pwd)/projects/lms2012/$a/Linuxmod_AM1808/" MOD="$a" -C "$(pwd)/am1808/DaVinci-PSP-SDK-03.20.00.13/src/kernel/linux-03.20.00.13/" INSTALL_MOD_PATH="$(pwd)/system/" modules 2>&1 | tee -a "$(pwd)/build.log"
make -j$(nproc --all) ARCH="arm" CROSS_COMPILE="$(pwd)/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-" M="$(pwd)/projects/lms2012/$a/Linuxmod_AM1808/" MOD="$a" -C "$(pwd)/am1808/DaVinci-PSP-SDK-03.20.00.13/src/kernel/linux-03.20.00.13/" INSTALL_MOD_PATH="$(pwd)/system/" modules_install 2>&1 | tee -a "$(pwd)/build.log"
done
cp -rfv "$(pwd)/am1808/DaVinci-PSP-SDK-03.20.00.13/src/kernel/linux-03.20.00.13/arch/arm/boot/uImage" "$(pwd)/uImage"
