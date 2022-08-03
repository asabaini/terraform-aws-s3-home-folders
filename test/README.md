# Modules Testing

This folder contains [Go](https://golang.org/) scripts based on [Terratest](https://github.com/gruntwork-io/terratest) that tests the [modules](../modules) to deploy a [Redash](https://redash.io) server in an [Amazon Web Services (AWS) account](http://aws.amazon.com/).

## Pre-requisites

* You must have [Go](https://golang.org/) installed on your computer.
* You must have [Dep](https://github.com/golang/dep) installed on your computer.

Please note that this code was written for Terraform 0.12.x.

## Quick start

Configure your [AWS access keys](http://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys) as environment variables:

```bash
export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)
```

Run the test:

```bash
export GOPATH=/set/gopath
go test -v -timeout 30m
```

### One test only

Go's default behavior is to run all tests in the current folder. By Specifying `-run FunctionName` one may run just one test

```bash
go test -v -timeout 30m -run TestGoSanity
```

### GOPATH

For tests to work properly, `GOPATH` has to contain `src`, i.e. your project has to be placed in a folder such as `/path/to/your/home/src/repo/test`.

```bash
export GOPATH=$(pwd)/../../../
```
