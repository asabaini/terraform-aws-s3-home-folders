package test

import (
	"fmt"
	"strings"
	"testing"

	terratest_aws "github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// TestSharedFolderOnly deploys a test s3 bucket
func TestSharedFolderOnly(t *testing.T) {

	t.Parallel()

	opts := &terraform.Options{
		TerraformDir: "../examples/data-stores/bucket-home-folders/",

		Vars: map[string]interface{}{
			"bucket_name": fmt.Sprintf("test-%s", strings.ToLower(random.UniqueId())),
			"home_folder_names": []string{fmt.Sprintf("test-%s", strings.ToLower(random.UniqueId())),
				fmt.Sprintf("test-%s", strings.ToLower(random.UniqueId()))},
			"shared_folder_name":      fmt.Sprintf("test-shared-folder-%s", strings.ToLower(random.UniqueId())),
			"create_personal_folders": false,
		},
	}

	// Clean up everything at the end of the test
	defer terraform.Destroy(t, opts)

	// Deploy the example
	terraform.InitAndApply(t, opts)
	terratest_aws.AssertS3BucketExists(t, "eu-south-1", opts.Vars["bucket_name"].(string))
	objectList, objerror := terratest_aws.GetS3ObjectContentsE(t, "eu-south-1", opts.Vars["bucket_name"].(string), "/")
	assert.NotEmpty(t, objectList)
	assert.Empty(t, objerror)
	assert.Contains(t, objectList, opts.Vars["shared_folder_name"].(string))
	assert.NotContains(t, objectList, opts.Vars["home_folder_names"].([]string)[0])
}
