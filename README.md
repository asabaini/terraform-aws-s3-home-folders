# Terraform S3 home folders

This folder contains terraform code to create IAM users and a S3 Bucket structured as a unix home folder. Each user has a personal private folder, and all users can read from a shared folder. As an example:

```bash
+-- README.md
+-- user1
|   +-- my_file1.txt
|   +-- another_file1.txt
+-- user2
|   +-- my_file2.txt
|   +-- another_file2.txt
+-- ....
+-- shared_folder
|   +-- file_for_everyone.txt
```

This repository is structured as follows:

* `examples`: example code to quickly deploy modules
* `modules`: source code that defines al components needed
* `test`: [Go](https://golang.org/) scripts based on [Terratest](https://github.com/gruntwork-io/terratest) to test modules

## Pre-requisites

* You must have [Terraform](https://www.terraform.io/) installed on your computer.
* You must have an [Amazon Web Services (AWS) account](http://aws.amazon.com/).

## Usage

```tf
terraform {
  required_version = ">= 0.12, < 0.13"
}

provider "aws" {
  region = "eu-central-1"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

module "home_folders" {
  source        = "asabaini/s3-home-folders/aws"
  version       = "~> 1.0.0"
  bucket_name = "mybucketname"
  user_names  = ["myuser1", "myuser2"]
  group_name  = "mygroup"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bucket\_name | The bucket name - must be globally unique | string | `""` | yes |
| user_names | The list of user names | list(string) | `[]` | yes |
| group_name | The group name | string | `""` | yes |
| path | The path for the users to be created in | string | `"/users/"` | no |
| shared_folder_name | The shared folder name | string | `"sharedfolder"` | no |

## Outputs

| Name | Description |
|------|-------------|
| user_names | The users' name |
user_access_keys | The users' keys |
user_secret_keys | The users' keys |
bucket_domain_name | The bucket domain name in the form bucketname.s3.amazonaws.com |
