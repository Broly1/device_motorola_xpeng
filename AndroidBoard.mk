#
# Copyright (C) 2017-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

INSTALLED_KERNEL_TARGET := $(PRODUCT_OUT)/kernel
recovery_uncompressed_ramdisk := $(PRODUCT_OUT)/ramdisk-recovery.cpio

RECOVERY_FIRMWARE_TARGETS := \
    mp_novatek_ts-NT36675-21101302-6044-xpeng.bin \
    novatek_ts-NT36675-21101302-6044-xpeng.bin

INSTALLED_RECOVERY_FIRMWARE_TARGETS := $(RECOVERY_FIRMWARE_TARGETS:%=$(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware/%)
$(INSTALLED_RECOVERY_FIRMWARE_TARGETS): $(INSTALLED_KERNEL_TARGET)
	echo -e ${CL_GRN}"Copying firmware to recovery"${CL_RST}
	@mkdir -p $(dir $@)
	cp $(@F:%=$(TARGET_OUT_VENDOR)/firmware/%) $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware/

$(recovery_uncompressed_ramdisk): $(INSTALLED_RECOVERY_FIRMWARE_TARGETS)
