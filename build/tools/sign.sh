#!/bin/bash

: <<'notice'
 *
 * Copyright (C) 2021 The ConquerOS Project
 *
 * Usage: bash vendor/conquer/build/tools/sign.sh <device name>
 *    Example: bash vendor/conquer/build/tools/sign.sh rosy
 *
notice

if [ "$#" -ne 1 ]; then
    echo "Usage ${0} <device name>"
    exit 1
fi

DEVICE="${1}"

Color_Off="\033[0m"
BRed="\033[1;31m"
BGreen="\033[1;32m"

if [[ ! -f build/envsetup.sh ]]; then
    printf "%bMust be run from the top level repo dir%b\n" "$BRed" "$Color_Off"
    exit 1
fi

. build/envsetup.sh

TOP="${ANDROID_BUILD_TOP}"

if [[ ! -e "${TOP}/out/target/product/$DEVICE/obj/PACKAGING/target_files_intermediates/" ]]; then
    printf "%b\nbuild target files first!!!%b\n" "$BRed" "$Color_Off"
    exit 1
fi

DEFAULT_PROP=${TOP}/out/target/product/$DEVICE/system/etc/prop.default
CONQUER_BUILD_VERSION=$(grep -n "ro.conquer.build.version" ${DEFAULT_PROP} | cut -d '=' -f2)
printf "%b\nConquer Build Version : ${CONQUER_BUILD_VERSION}%b\n" "$BGreen" "$Color_Off"

if [[ ! -e ${TOP}/vendor/keys ]]; then
    printf "%b\nClone signing keys first%b\n" "$BRed" "$Color_Off"
    exit 1
fi

python2 ${TOP}/build/tools/releasetools/sign_target_files_apks -p ${TOP}/out/host/linux-x86/ -o -d ${TOP}/vendor/keys \
        ${TOP}/out/target/product/${DEVICE}/obj/PACKAGING/target_files_intermediates/*-target_files-*.zip \
        ${TOP}/signed-target_files.zip

python2 ${TOP}/build/tools/releasetools/ota_from_target_files -p ${TOP}/out/host/linux-x86/ -k ${TOP}/vendor/keys/releasekey \
        --block --backup=true \
        ${TOP}/signed-target_files.zip \
        ${CONQUER_BUILD_VERSION}.zip

if [[ -f ${CONQUER_BUILD_VERSION}.zip ]]; then
MD5=$(md5sum ${TOP}/${CONQUER_BUILD_VERSION}.zip | awk '{print $1}')
SIZE=$(du -sh ${TOP}/${CONQUER_BUILD_VERSION}.zip | awk '{print $1}')
printf "%b\n======================= Package complete =======================\n
zip: ${TOP}/${CONQUER_BUILD_VERSION}.zip
MD5: ${MD5}
size: ${SIZE}
\n               ConquerOS Sussy - Be The Conqueror
================================================================\n%b" "${BGreen}" "${Color_Off}"
fi
