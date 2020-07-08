# Terraform S3 home folders

This folder contains terraform code to create IAM users and a S3 Bucket structured as a unix home folder. One user has a personal folder, and all users can read from a shared folder. As an example:

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
