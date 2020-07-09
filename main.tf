terraform {
  required_version = ">= 0.12, < 0.13"
}

provider "aws" {
  region = "eu-central-1"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

module "bucket-home-folders" {
  source       = "./modules/data-stores/bucket-home-folders"
  bucket_name  = var.bucket_name
  folder_names = var.user_names
}

module "users" {
  source     = "./modules/iam/users"
  user_names = var.user_names
  path       = var.path
}

resource "aws_iam_group" "group" {
  name = var.group_name
  path = var.path
}

resource "aws_iam_group_membership" "group_membership" {
  name = var.group_name

  users = var.user_names

  group = aws_iam_group.group.name
}

resource "aws_iam_group_policy" "bucket_policy" {
  name  = "allow_users_to_write_in_personal_folders"
  group = aws_iam_group.group.id

  policy = <<EOF
{
 "Version":"2012-10-17",
  "Statement": [
    {
      "Sid": "AllowGroupToSeeBucketListInTheConsole",
      "Action": [ "s3:ListAllMyBuckets", "s3:GetBucketLocation" ],
      "Effect": "Allow",
      "Resource": [ "arn:aws:s3:::*"  ]
    },
    {
      "Sid": "AllowRootLevelListingOfTheBucket",
      "Action": ["s3:ListBucket"],
      "Effect": "Allow",
      "Resource": ["arn:aws:s3:::${var.bucket_name}"],
      "Condition":{ 
            "StringEquals":{
                    "s3:prefix":[""], "s3:delimiter":["/"]
                           }
                 }
    },
    {
      "Sid": "AllowListBucketOfASpecificUserPrefix",
      "Action": ["s3:ListBucket"],
      "Effect": "Allow",
      "Resource": ["arn:aws:s3:::${var.bucket_name}"],
      "Condition":{  "StringLike":{"s3:prefix":["$${aws:username}/*"] }
       }
    },
      {
     "Sid": "AllowUserSpecificActionsOnlyInTheSpecificUserPrefix",
         "Effect":"Allow",
         "Action":[
            "s3:PutObject",
            "s3:GetObject",
            "s3:GetObjectVersion",
            "s3:DeleteObject",
            "s3:DeleteObjectVersion"
         ],
         "Resource":"arn:aws:s3:::${var.bucket_name}/$${aws:username}/*"
      }
  ]
} 
EOF
}


