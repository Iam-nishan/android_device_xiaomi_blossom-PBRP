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
    $(LOCAL_PATH)/recovery/root/system/lib64/libfscrypttwrp.so:system/lib64/libfscrypttwrp.so


# --- MTK TEE bring-up for FBE decryption ---
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/init.recovery.mt6765.rc:init.recovery.mt6765.rc

# PBRP Decryption Blobs
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/vendor/bin/hw/android.hardware.gatekeeper@1.0-service-recovery:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/bin/hw/android.hardware.gatekeeper@1.0-service-recovery \
    $(DEVICE_PATH)/recovery/root/system/lib64/libkeymaster4.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeymaster4.so \
    $(DEVICE_PATH)/recovery/root/system/lib64/libkeymaster4_1support.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeymaster4_1support.so \
    $(DEVICE_PATH)/recovery/root/system/lib64/libkeymaster_messages.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeymaster_messages.so \
    $(DEVICE_PATH)/recovery/root/system/lib64/libhidlbase.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libhidlbase.so \
    $(DEVICE_PATH)/recovery/root/system/lib64/libutils.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libutils.so \
    $(DEVICE_PATH)/recovery/root/system/lib64/android.hardware.gatekeeper@1.0.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/android.hardware.gatekeeper@1.0.so
