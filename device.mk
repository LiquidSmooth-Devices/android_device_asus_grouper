#
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_PROPERTY_OVERRIDES := \
    ro.carrier=wifi-only

PRODUCT_COPY_FILES := \
    device/asus/grouper/fstab.grouper:root/fstab.grouper \
    device/asus/grouper/init.grouper.rc:root/init.grouper.rc \
    device/asus/grouper/fstab/fstab.grouper.all-EXT4:system/extras/fstab/fstab.grouper.all-EXT4 \
    device/asus/grouper/fstab/fstab.grouper.all-F2FS:system/extras/fstab/fstab.grouper.all-F2FS \
    device/asus/grouper/fstab/fstab.grouper.data-F2FS:system/extras/fstab/fstab.grouper.data-F2FS \
    device/asus/grouper/tools/repack-and-flash.sh:system/extras/tools/repack-and-flash.sh \
    device/asus/grouper/tools/format-system.sh:system/extras/tools/format-system.sh \
    device/asus/grouper/tools/kernel/repackimg.sh:system/extras/tools/kernel/repackimg.sh \
    device/asus/grouper/tools/kernel/unpackimg.sh:system/extras/tools/kernel/unpackimg.sh \
    device/asus/grouper/tools/kernel/cleanup.sh:system/extras//tools/kernel/cleanup.sh \
    device/asus/grouper/tools/kernel/authors.txt:system/extras/tools/kernel/authors.txt \
    device/asus/grouper/tools/kernel/bin/aik:system/extras/tools/kernel/bin/aik \
    device/asus/grouper/tools/kernel/bin/busybox:system/extras/tools/kernel/bin/busybox \
    device/asus/grouper/tools/kernel/bin/file:system/extras/tools/kernel/bin/file \
    device/asus/grouper/tools/kernel/bin/lz4:system/extras/tools/kernel/bin/lz4 \
    device/asus/grouper/tools/kernel/bin/magic:system/extras/tools/kernel/bin/magic \
    device/asus/grouper/tools/kernel/bin/mkbootfs:system/extras/tools/kernel/bin/mkbootfs \
    device/asus/grouper/tools/kernel/bin/mkbootimg:system/extras/tools/kernel/bin/mkbootimg \
    device/asus/grouper/tools/kernel/bin/unpackbootimg:system/extras/tools/kernel/bin/unpackbootimg \
    device/asus/grouper/tools/kernel/bin/xz:system/extras/tools/kernel/bin/xz

# the actual meat of the device-specific product definition
$(call inherit-product, device/asus/grouper/device-common.mk)

# inherit from the non-open-source side, if present
$(call inherit-product-if-exists, vendor/asus/grouper/device-vendor.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=wifi-only
    
# OTA ID
PRODUCT_PROPERTY_OVERRIDES += \
    otaupdater.otaid=liquidgrouper

DEVICE_PACKAGE_OVERLAYS := \
    device/asus/grouper/overlay

# F2FS
PRODUCT_PACKAGES += \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs

# Filesystem management tools
PRODUCT_PACKAGES += \
    setup_fs \
    e2fsck