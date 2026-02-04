# Inherit from common TWRP product
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit device configuration
$(call inherit-product, device/xiaomi/blossom/device.mk)

PRODUCT_DEVICE := blossom
PRODUCT_NAME := twrp_blossom
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi 9A / 9C / 10A (blossom)
PRODUCT_MANUFACTURER := Xiaomi
