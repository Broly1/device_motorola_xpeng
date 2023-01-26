#!/vendor/bin/sh
#
# Identify fingerprint sensor model
#
# Copyright (c) 2019 Lenovo
# All rights reserved.
#
# Changed Log:
# ---------------------------------
# April 15, 2019  chengql2@lenovo.com  Initial version
# April 28, 2019  chengql2  Add fps_id creating step
# December 2, 2019  chengql2  Store fps_id into persist fs, and identify sensor
#                             again when secure unit boots as factory mode.

script_name=${0##*/}
script_name=${script_name%.*}
function log {
    echo "$script_name: $*" > /dev/kmsg
}

persist_fps_id=/mnt/vendor/persist/fps/vendor_id

FPS_VENDOR_GOODIX=goodix
FPS_VENDOR_EGIS=egis
FPS_VENDOR_NONE=none

function is_file_ready {
    if [ "$(ls $1)" != "" ]; then
        return 0
    fi
    log "$0 - wait for $1 ..."
    for i in $(seq 1 100); do
        if [ "$(ls $1)" == "" ]; then
            continue
        fi
        return 0
    done
    log "$0 - timeout"
    return 1
}

function ident_fps {
    log "- install Goodix FPS kernel module"
    insmod /vendor/lib/modules/goodix_fod_mmi.ko

    log "- identify Goodix fingerprint sensor"
    is_file_ready /dev/goodix_fp
    is_file_ready /vendor/firmware_mnt/image/goodixfp.mdt
    /vendor/bin/hw/goodix_ident
    if [ $? -eq 0 ]; then
        log "ok"
        echo $FPS_VENDOR_GOODIX > $persist_fps_id
        return 0
    fi

    log "- uninstall Goodix FPS kernel module"
    rmmod goodix_fod_mmi

    log "- install Egis FPS kernel module"
    insmod /vendor/lib/modules/ets_fps_mmi.ko
    echo $FPS_VENDOR_EGIS > $persist_fps_id
    return 0
}

if [ ! -f $persist_fps_id ]; then
    ident_fps
    return $?
fi

fps_vendor=$(cat $persist_fps_id)
if [ -z $fps_vendor ]; then
    fps_vendor=$FPS_VENDOR_NONE
fi
log "FPS vendor: $fps_vendor"

if [ $fps_vendor == $FPS_VENDOR_EGIS ]; then
    log "- install EgisTech FPS kernel module"
    insmod /vendor/lib/modules/ets_fps_mmi.ko
    return $?
fi

if [ $fps_vendor == $FPS_VENDOR_GOODIX ]; then
    log "- install Goodix FPS kernel module"
    insmod /vendor/lib/modules/goodix_fod_mmi.ko
    return $?
fi

ident_fps
return $?
