module "bucket-home-folders" {
  source                  = "./modules/data-stores/bucket-home-folders"
  bucket_name             = var.bucket_name
  home_folder_names       = var.user_names
  shared_folder_name      = var.shared_folder_name
  create_personal_folders = var.create_personal_folders
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

resource "aws_iam_group_policy" "list_all_buckets_policy" {
  group = aws_iam_group.group.id

  policy = <<EOF
{
"Version":"2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [ "s3:ListAllMyBuckets", "s3:GetBucketLocation" ],
      "Resource": [ "arn:aws:s3:::*"  ]
    },
    {
      "Effect": "Allow",
      "Action": ["s3:ListBucket"],
      "Resource": ["arn:aws:s3:::${var.bucket_name}"],
      "Condition":{ 
        "StringEquals":{
                "s3:prefix":[""], "s3:delimiter":["/"]
                        }
                  }
    }
  ]
}
EOF
}

resource "aws_iam_group_policy" "write_in_personal_folder_policy" {
  count = var.create_personal_folders ? 1 : 0
  group = aws_iam_group.group.id

  policy = <<EOF
{
"Version":"2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:ListBucket"],
      "Resource": ["arn:aws:s3:::${var.bucket_name}"],
      "Condition":{  "StringLike":{"s3:prefix":["$${aws:username}/*"] }
       }
    },
    {
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

resource "aws_iam_group_policy" "read_shared_folder_policy" {
  group = aws_iam_group.group.id

  policy = <<EOF
{
"Version":"2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:ListBucket"],
      "Resource": ["arn:aws:s3:::${var.bucket_name}"],
      "Condition":{  "StringLike":{"s3:prefix":["${var.shared_folder_name}/*"] }
       }
    },
    {
      "Effect":"Allow",
      "Action":[
        "s3:GetObject",
        "s3:GetObjectVersion"
      ],
      "Resource":"arn:aws:s3:::${var.bucket_name}/${var.shared_folder_name}/*"
    }
  ]
}
EOF
}

