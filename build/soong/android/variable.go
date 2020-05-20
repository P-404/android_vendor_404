package android
type Product_variables struct {
	Target_init_vendor_lib struct {
		Whole_static_libs []string
	}
	Target_shim_libs struct {
		Cppflags []string
	}
	Additional_gralloc_10_usage_bits struct {
		Cppflags []string
	}
        Bootloader_message_offset struct {
		Cflags []string
	}
}

type ProductVariables struct {
	Target_init_vendor_lib  *string `json:",omitempty"`
	Target_shim_libs  *string `json:",omitempty"`
	Additional_gralloc_10_usage_bits  *string `json:",omitempty"`
        Bootloader_message_offset  *int `json:",omitempty"`
}
