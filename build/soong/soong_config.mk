add_json_str_omitempty = $(if $(strip $(2)),$(call add_json_str, $(1), $(2)))
add_json_val_default = $(call add_json_val, $(1), $(if $(strip $(2)), $(2), $(3)))

_json_contents := $(_json_contents)    "P404":{$(newline)

# See build/core/soong_config.mk for the add_json_* functions you can use here.
$(call add_json_str_omitempty, Target_init_vendor_lib,              $(TARGET_INIT_VENDOR_LIB))
$(call add_json_str_omitempty, Target_process_sdk_version_override, $(TARGET_PROCESS_SDK_VERSION_OVERRIDE))
$(call add_json_str,  Target_shim_libs,                             $(TARGET_LD_SHIM_LIBS))
$(call add_json_str_omitempty, Target_surfaceflinger_fod_lib,       $(TARGET_SURFACEFLINGER_FOD_LIB))
$(call add_json_bool, Target_uses_color_metadata,                   $(filter true,$(TARGET_USES_COLOR_METADATA)))
$(call add_json_str_omitempty, Additional_gralloc_10_usage_bits,    $(TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS))
$(call add_json_val_default, Bootloader_message_offset,             $(BOOTLOADER_MESSAGE_OFFSET), 0)
$(call add_json_bool, 	Uses_qcom_um_family, 				$(filter true,$(TARGET_USES_QCOM_UM_FAMILY)))
$(call add_json_bool, 	Uses_qcom_um_3_18_family, 			$(filter true,$(TARGET_USES_QCOM_UM_3_18_FAMILY)))
$(call add_json_bool, 	Uses_qcom_um_4_4_family, 			$(filter true,$(TARGET_USES_QCOM_UM_4_4_FAMILY)))
$(call add_json_bool, 	Uses_qcom_um_4_9_family, 			$(filter true,$(TARGET_USES_QCOM_UM_4_9_FAMILY)))
$(call add_json_bool, 	Uses_qcom_um_4_14_family, 			$(filter true,$(TARGET_USES_QCOM_UM_4_14_FAMILY)))

# This causes the build system to strip out the last comma in our nested struct, to keep the JSON valid.
_json_contents := $(_json_contents)__SV_END

_json_contents := $(_json_contents)    },$(newline)
