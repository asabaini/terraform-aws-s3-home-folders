package test

import (
	"fmt"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

// TestS3Example deploys a test s3 bucket
func TestS3Example(t *testing.T) {

	t.Parallel()

	opts := &terraform.Options{
		TerraformDir: "../examples/data-stores/s3/",

		Vars: map[string]interface{}{
			"bucket_name": fmt.Sprintf("test-%s", strings.ToLower(random.UniqueId())),
		},
	}

	// Clean up everything at the end of the test
	defer terraform.Destroy(t, opts)

	// Deploy the example
	terraform.InitAndApply(t, opts)

}
