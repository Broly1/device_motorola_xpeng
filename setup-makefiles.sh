#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

export DEVICE=xpeng
export DEVICE_COMMON=sm7325-common
export VENDOR=motorola

"./../../${VENDOR}/${DEVICE_COMMON}/setup-makefiles.sh" "$@"
