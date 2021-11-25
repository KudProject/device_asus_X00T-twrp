#
# Copyright 2017 The Android Open Source Project
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

# Release name
PRODUCT_RELEASE_NAME := X00T

$(call inherit-product, build/target/product/aosp_base.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.keystore=sdm660

# APEX libraries
PRODUCT_COPY_FILES += \
    $(OUT_DIR)/target/product/$(PRODUCT_RELEASE_NAME)/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so

# Crypto
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# Soong namespace
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := X00T
PRODUCT_NAME := omni_X00T
PRODUCT_BRAND := asus
PRODUCT_MODEL := ASUS_X00TD
PRODUCT_MANUFACTURER := asus

PRODUCT_PROPERTY_OVERRIDES += \
    ro.treble.enabled=true \
    sys.usb.controller=a800000.dwc3 \
    sys.usb.rmnet.func.name=rmnet_bam \
    sys.usb.rndis.func.name=rndis_bam

# for stock ROM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.CID=CID_ERROR \
    ro.hq.project=ZQL1650
