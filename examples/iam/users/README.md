# IAM users example

This folder contains a [Terraform](https://www.terraform.io/) configuration that shows an example of how to use the [iam users module](../../modules/iam/users) to deploy a S3 bucket (using [IAM](https://aws.amazon.com/iam/)) in an [Amazon Web Services (AWS) account](http://aws.amazon.com/).

## Pre-requisites

* You must have [Terraform](https://www.terraform.io/) installed on your computer.
* You must have an [Amazon Web Services (AWS) account](http://aws.amazon.com/).

Please note that this code was written for Terraform 0.12.x.

## Quick start

Configure your [AWS access keys](http://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys) as environment variables:

```bash
export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)
```

Deploy the code:

```bash
terraform init
terraform apply
```

Clean up when you're done:

```bash
terraform destroy
```
