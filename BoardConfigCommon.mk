#
# Copyright 2019 The Android Open Source Project
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
# inherit from the proprietary version

BOARD_VENDOR := pantech

COMMON_PATH := device/pantech/iron-common

TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/include

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8960
TARGET_NO_BOOTLOADER := true

# CAF HALs
TARGET_QCOM_AUDIO_VARIANT := caf-msm8960
TARGET_QCOM_MEDIA_VARIANT := caf-msm8960
TARGET_QCOM_DISPLAY_VARIANT := caf-msm8960

# Platform
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait

# Kernel
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x2000000
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_FORCE_RAMDISK_ADDRESS := 0x82200000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x2000000
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_VERSION := 3.4.108
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_SOURCE := kernel/ef52l

BOARD_KERNEL_CMDLINE := console=NULL,115200,n8 androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += loglevel=0 vmalloc=0x16000000 maxcpus=2
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-hidl"

# Assert
TARGET_BOARD_INFO_FILE := $(PLATFORM_PATH)/board-info.txt

# APEX image
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Audio
AUDIO_FEATURE_ENABLED_ACDB_LICENSE := true
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_COMPRESS_CAPTURE := true
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := false
AUDIO_FEATURE_ENABLED_CUSTOMSTEREO := true
#AUDIO_FEATURE_ENABLED_DEV_ARBI := ?
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := true
#AUDIO_FEATURE_ENABLED_DTS_EAGLE := ?
AUDIO_FEATURE_ENABLED_EXTN_FLAC_DECODER := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_EXTN_RESAMPLER := false
AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_FLUENCE := false
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
AUDIO_FEATURE_ENABLED_HDMI_EDID := true
AUDIO_FEATURE_ENABLED_HDMI_SPK := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_HW_ACCELERATED_EFFECTS := false
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := false
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_LISTEN := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
AUDIO_FEATURE_ENABLED_MULTIPLE_TUNNEL := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_NT_PAUSE_TIMEOUT := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
#AUDIO_FEATURE_ENABLED_PROXY_DEVICE := ?
AUDIO_FEATURE_ENABLED_SPKR_PROTECTION := true

AUDIO_USE_LL_AS_PRIMARY_OUTPUT := true

BOARD_SUPPORTS_SOUND_TRIGGER := false
BOARD_USES_ALSA_AUDIO := true

DOLBY_DAP := true
DOLBY_DDP := true
#DOLBY_UDC_MULTICHANNEL := ?
#DOLBY_UDC_STREAMING_HLS := ?
DOLBY_UDC := true
DTS_CODEC_M_ := true
MM_AUDIO_ENABLED_FTM := true
MM_AUDIO_ENABLED_SAFX := true
TARGET_USES_QCOM_MM_AUDIO := true

USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(COMMON_PATH)/bluetooth
QCOM_BT_USE_BTNV := true
QCOM_BT_USE_SMD_TTY := true

# Camera
BOARD_GLOBAL_CFLAGS += -DCAMERA_VENDOR_L_COMPAT
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_USES_MEDIA_EXTENSIONS := true

BOARD_USES_CAMERA_FAST_AUTOFOCUS := true
BOARD_GLOBAL_CFLAGS += -DPANTECH_CAMERA_HARDWARE
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
BOARD_GLOBAL_CFLAGS += -DMETADATA_CAMERA_SOURCE
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true
HEALTHD_USE_BATTERY_INFO := true

# CNE and DPM
BOARD_USES_QCNE := true

# Crypto
TARGET_HW_DISK_ENCRYPTION := false

TARGET_NO_SD_ADOPT_ENCRYPTION := true

# Display
TARGET_USES_ION	:= true
TARGET_USES_NEW_ION_API := true
TARGET_DISPLAY_INSECURE_MM_HEAP := true

# Enable dexpreopt to speed boot time
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
			DONT_DEXPREOPT_PREBUILTS := true
      WITH_DEXPREOPT := true
      WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true
    endif
  endif
endif
#DONT_DEXPREOPT_PREBUILTS := true

# Install kernel modules on system
NEED_KERNEL_MODULE_SYSTEM := true

# EXFAT
TARGET_EXFAT_DRIVER := exfat

# FM
BOARD_HAVE_FM_RADIO := true
BOARD_DISABLE_FMRADIO_LIBJNI := true

# GPS
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true
TARGET_NO_RPC := true
TARGET_PROVIDES_GPS_LOC_API := true

# HIDL
DEVICE_FRAMEWORK_MANIFEST_FILE := $(PLATFORM_PATH)/framework_manifest.xml
DEVICE_MANIFEST_FILE := $(PLATFORM_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(PLATFORM_PATH)/compatibility_matrix.xml

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520 #20MB
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520 #20MB
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1782579200 #1.7GB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27577531392 #25.7GB

BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_EXFAT_DRIVER := exfat

TARGET_COPY_OUT_VENDOR := vendor
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USES_MKE2FS := true

BOARD_SUPPRESS_EMMC_WIPE := true

TARGET_OTA_ASSERT_DEVICE := ef52l,ef52s,ef52k

# Power
TARGET_USES_INTERACTION_BOOST := true
TARGET_HAS_NO_WLAN_STATS := true
TARGET_HAS_NO_POWER_STATS := true
TARGET_BOOTANIMATION_MULTITHREAD_DECODE := true
TARGET_POWERHAL_VARIANT	:= qcom

# QCOM
BOARD_USES_QCOM_HARDWARE := true
TARGET_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP
TARGET_GLOBAL_CPPFLAGS += -DQCOM_HARDWARE -DQCOM_BSP

# Recovery
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/fstab.qcom

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(PLATFORM_PATH)

# RIL
TARGET_PROVIDES_QTI_TELEPHONY_JAR := true
TARGET_RIL_VARIANT := caf
TARGET_USES_OLD_MNC_FORMAT := true
BOARD_RIL_CLASS := ../../../device/pantech/iron-common/ril/

# Flags
BOARD_NO_SECURE_DISCARD := true

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=7

MALLOC_SVELTE := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy

SELINUX_IGNORE_NEVERALLOWS := true
WITHOUT_LINEAGE_SEPOLICY := true

#Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_pantech
TARGET_RECOVERY_DEVICE_MODULES := libinit_pantech
TARGET_NO_INITLOGO := true

BOARD_USES_OVERLAY := true
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true

# LightHAL
TARGET_PROVIDES_LIBLIGHT := true

HAVE_ADRENO_SOURCE := false
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# QCOM enhanced A/V
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

BOARD_USES_SECURE_SERVICES := true

BOARD_USES_EXTRA_THERMAL_SENSOR := true

# Enable keymaster app checking
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

BOARD_VOLD_MAX_PARTITIONS := 28

# Sensors
TARGET_NEEDS_GCC_LIBC := true

PRODUCT_GMS_CLIENTID_BASE := android-pantech

# Enable Minikin text layout engine
USE_MINIKIN := true
       
# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_NAME := "wlan"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP := "ap"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Inherit the proprietary files
-include vendor/pantech/iron-common/BoardConfigVendor.mk
