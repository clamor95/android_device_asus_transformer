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

include hardware/nvidia/tegra3/BoardConfigCommon.mk

TARGET_BOOTLOADER_BOARD_NAME := transformer
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608 # 8 M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608 # 8 M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 805306368 # 768 M
BOARD_CACHEIMAGE_PARTITION_SIZE := 448790528 # 428 M
# BOARD_USERDATAIMAGE_PARTITION_SIZE := 29618601984 # 27.6 G
BOARD_FLASH_BLOCK_SIZE := 4096

# Disable journaling on system.img to save space
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0

# Only pre-optimize the boot image
WITH_DEXPREOPT_BOOT_IMG_ONLY := true

# Configure jemalloc for low-memory
MALLOC_SVELTE := true

# Use clang platform builds
USE_CLANG_PLATFORM_BUILD := true

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=$(TARGET_BOOTLOADER_BOARD_NAME)
TARGET_KERNEL_CONFIG := transformer_defconfig
TARGET_KERNEL_SOURCE := kernel/nvidia/tegra3
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-eabi-4.8/bin
KERNEL_TOOLCHAIN_PREFIX := arm-eabi-

# Wi-Fi
BOARD_WLAN_DEVICE           := bcmdhd
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_CUSTOM_BT_CONFIG := device/asus/transformer/bluetooth/vnd_transformer.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/asus/transformer/bluetooth

# Sensors
BOARD_USES_INVENSENSE_GYRO := INVENSENSE_MPU3050

# Dump State
BOARD_HAL_STATIC_LIBRARIES := libdumpstate.transformer

# Security
BOARD_SEPOLICY_DIRS += device/asus/transformer/sepolicy
