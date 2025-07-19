package generator

import (
	"fmt"

	"android/soong/android"
)

func p404ExpandVariables(ctx android.ModuleContext, in string) string {
	p404Vars := ctx.Config().VendorConfig("p404VarsPlugin")

	out, err := android.Expand(in, func(name string) (string, error) {
		if p404Vars.IsSet(name) {
			return p404Vars.String(name), nil
		}
		// This variable is not for us, restore what the original
		// variable string will have looked like for an Expand
		// that comes later.
		return fmt.Sprintf("$(%s)", name), nil
	})

	if err != nil {
		ctx.PropertyErrorf("%s: %s", in, err.Error())
		return ""
	}

	return out
}
