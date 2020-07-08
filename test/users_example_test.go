package test

import (
	"fmt"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

// TestIAMUsersExample creates random iam users
func TestIAMUsersExample(t *testing.T) {

	t.Parallel()

	opts := &terraform.Options{
		TerraformDir: "../examples/iam/users/",

		Vars: map[string]interface{}{
			"user_names": []string{fmt.Sprintf("test-%s", strings.ToLower(random.UniqueId())),
				fmt.Sprintf("test-%s", strings.ToLower(random.UniqueId()))},
		},
	}

	// Clean up everything at the end of the test
	defer terraform.Destroy(t, opts)

	// Deploy the example
	terraform.InitAndApply(t, opts)

}
