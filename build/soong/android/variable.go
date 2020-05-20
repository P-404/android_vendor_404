package android
type Product_variables struct {
	Target_init_vendor_lib struct {
		Whole_static_libs []string
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
	Additional_gralloc_10_usage_bits  *string `json:",omitempty"`
        Bootloader_message_offset  *int `json:",omitempty"`
}
