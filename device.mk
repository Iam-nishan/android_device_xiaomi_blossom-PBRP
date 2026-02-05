DEVICE_PATH := device/xiaomi/blossom
#
# Copyright (C) 2023 The OrangeFox Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Installs developer gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# API
PRODUCT_SHIPPING_API_LEVEL := 29

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Crypto
PRODUCT_VENDOR_PROPERTIES += \
    ro.crypto.volume.filenames_mode=aes-256-cts

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service-recovery \
    $(DEVICE_PATH)/recovery/root/vendor/bin/teei_daemon:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/bin/teei_daemon:755 \
    android.hardware.gatekeeper@1.0-impl-recovery

PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.gatekeeper=beanpod

# Kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/Image.gz:kernel

# Keymaster
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster4 \
    libpuresoftkeymasterdevice

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

PRODUCT_PACKAGES += \
    libshim_beanpod

PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.kmsetkey=beanpod

# TEE
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.mtk_microtrust_tee_support=1

# USB
PRODUCT_SYSTEM_PROPERTIES += \
    ro.sys.usb.storage.type=mtp

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 32
PRODUCT_COPY_FILES += \

RECOVERY_SYMLINKS += \
    system/lib64/libfscrypt.so:libfscrypttwrp.so

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/system/lib64/libfscrypttwrp.so:system/lib64/libfscrypttwrp.so

# --- MTK TEE bring-up for FBE decryption ---
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/init.recovery.mt6765.rc:init.recovery.mt6765.rc

# PBRP Decryption Blobs
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/vendor/bin/hw/android.hardware.gatekeeper@1.0-service-recovery:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/bin/hw/android.hardware.gatekeeper@1.0-service-recovery:755 \
    $(DEVICE_PATH)/recovery/root/vendor/bin/hw/android.hardware.keymaster@4.0-service.beanpod:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/bin/hw/android.hardware.keymaster@4.0-service.beanpod:755 \
    $(DEVICE_PATH)/recovery/root/system/lib64/libkeymaster4.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeymaster4.so:755 \
    $(DEVICE_PATH)/recovery/root/system/lib64/libkeymaster4_1support.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeymaster4_1support.so \
    $(DEVICE_PATH)/recovery/root/system/lib64/libkeymaster_messages.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeymaster_messages.so \
    $(DEVICE_PATH)/recovery/root/system/lib64/libhidlbase.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libhidlbase.so \
    $(DEVICE_PATH)/recovery/root/system/lib64/libutils.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libutils.so \
    $(DEVICE_PATH)/recovery/root/system/lib64/android.hardware.gatekeeper@1.0.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/android.hardware.gatekeeper@1.0.so
PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/root/vendor/thh/ta/04190000000000000000000000000000.ta:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/thh/ta/04190000000000000000000000000000.ta
PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/root/vendor/thh/ta/08010203000000000000000000000000.ta:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/thh/ta/08010203000000000000000000000000.ta
PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/root/vendor/thh/ta/14498ace2a8f11e880c8509a4c146f4c.ta:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/thh/ta/14498ace2a8f11e880c8509a4c146f4c.ta
PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/root/vendor/thh/ta/3d08821c33a611e6a1fa089e01c83aa2.ta:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/thh/ta/3d08821c33a611e6a1fa089e01c83aa2.ta
PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/root/vendor/thh/ta/7778c03fc30c4dd0a319ea29643d4d4b.ta:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/thh/ta/7778c03fc30c4dd0a319ea29643d4d4b.ta
PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/root/vendor/thh/ta/86f623f6a2994dfdb560ffd3e5a62c29.ta:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/thh/ta/86f623f6a2994dfdb560ffd3e5a62c29.ta
PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/root/vendor/thh/ta/93feffccd8ca11e796c7c7a21acb4932.ta:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/thh/ta/93feffccd8ca11e796c7c7a21acb4932.ta
PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/root/vendor/thh/ta/c09c9c5daa504b78b0e46eda61556c3a.ta:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/thh/ta/c09c9c5daa504b78b0e46eda61556c3a.ta
PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/root/vendor/thh/ta/c1882f2d885e4e13a8c8e2622461b2fa.ta:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/thh/ta/c1882f2d885e4e13a8c8e2622461b2fa.ta
PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/root/vendor/thh/ta/d91f322ad5a441d5955110eda3272fc0.ta:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/thh/ta/d91f322ad5a441d5955110eda3272fc0.ta
PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/root/vendor/thh/ta/e5140b3376fa4c63ab18062caab2fb5c.ta:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/thh/ta/e5140b3376fa4c63ab18062caab2fb5c.ta
