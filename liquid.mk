#
# Copyright (C) 2012 The CyanogenMod Project
# Copyright (C) 2014 The LiquidSmooth Project
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
PRODUCT_RELEASE_NAME := Nexus7

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 800

# tablet
$(call inherit-product, vendor/liquid/config/common_tablet.mk)

# enhanced NFC
$(call inherit-product, vendor/liquid/config/nfc_enhanced.mk)

# device
$(call inherit-product, device/asus/grouper/full_grouper.mk)

# product
PRODUCT_DEVICE := grouper
PRODUCT_BRAND := google
PRODUCT_NAME := liquid_grouper
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := asus
PRODUCT_PROPERTY_OVERRIDES += ro.buildzipid=liquid.grouper.$(shell date +%m%d%y).$(shell date +%H%M%S)

#Needed for VOIP+SIP
PRODUCT_PACKAGES := \
    InCallUI \
    Dialer \
    rild

# override
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_NUMBER=VS98011A.1378346052 \
    PRODUCT_NAME=nakasi \
    TARGET_BUILD_TYPE=user \
    BUILD_VERSION_TAGS=release-keys \
    PRIVATE_BUILD_DESC="nakasi-user 4.4.3 KTU84L 1148727 release-keys" \
    BUILD_FINGERPRINT="google/nakasi/grouper:4.4.3/KTU84L/1148727:user/release-keys"
