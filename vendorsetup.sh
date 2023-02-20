#!/bin/bash
# Clone/Fetch Upstream Device Dependencies

# Device tree
if [ ! -d "device/motorola/sm7325-common" ]; then
	git clone -b thirteen https://github.com/PixelExperience-Devices/device_motorola_sm7325-common.git device/motorola/sm7325-common
else
	printf "device/motorola/sm7325-common found!\n"
fi

if [ ! -d "vendor/motorola/xpeng" ]; then
	git clone -b thirteen https://gitlab.com/Broly1/vendor_motorola_xpeng.git vendor/motorola/xpeng
else
	printf "vendor/motorola/xpeng found!\n"
fi

if [ ! -d "vendor/motorola/sm7325-common" ]; then
	git clone -b thirteen https://gitlab.com/Broly1/vendor_motorola_sm7325-common.git vendor/motorola/sm7325-common
else
	printf "vendor/motorola/sm7325-common found!\n"
fi

# Hardware motorola
if [ ! -d "hardware/motorola" ]; then
	git clone -b https://github.com/PixelExperience/hardware_motorola.git hardware/motorola
else
	printf "hardware/motorola found!\n"
fi

# Kernel
if [ ! -d "kernel/motorola/sm7325" ]; then
	git clone -b thirteen https://github.com/Broly1/kernel_motorola_sm7325.git kernel/motorola/sm7325
else
	printf "kernel/motorola/sm7325 found!\n"
fi

# System_qcom
if [ ! -d "system/qcom" ]; then
	git clone -b lineage-20 https://github.com/LineageOS/android_system_qcom.git system/qcom
else
	printf "system/qcom found!\n"
fi