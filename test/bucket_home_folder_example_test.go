package test

import (
	"fmt"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	terratest_aws "github.com/gruntwork-io/terratest/modules/aws"
	"github.com/stretchr/testify/assert"
)

// TestS3Example deploys a test s3 bucket
func TestBucketHomeFolderExample(t *testing.T) {

	t.Parallel()

	opts := &terraform.Options{
		TerraformDir: "../examples/data-stores/bucket-home-folders/",

		Vars: map[string]interface{}{
			"bucket_name": fmt.Sprintf("test-%s", strings.ToLower(random.UniqueId())),
			"home_folder_names": []string{fmt.Sprintf("test-%s", strings.ToLower(random.UniqueId())),
				fmt.Sprintf("test-%s", strings.ToLower(random.UniqueId()))},
		},
	}

	// Clean up everything at the end of the test
	defer terraform.Destroy(t, opts)

	// Deploy the example
	terraform.InitAndApply(t, opts)
	terratest_aws.AssertS3BucketExists(t, "eu-central-1", opts.Vars["bucket_name"].(string))
  objectList := GetS3ObjectContents(t, "eu-central-1", opts.Vars["bucket_name"].(string), key string) string
	assert.Contains(t, folderlist, opts.Vars["home_folder_names"][0].(string))
}
