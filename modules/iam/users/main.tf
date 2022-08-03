resource "aws_iam_user" "user" {
  for_each = var.user_names
  
  name = each.value
  path = var.path
}

resource "aws_iam_access_key" "user_access_key" {
  for_each = var.user_names

  
  user = aws_iam_user.user[each.value].name
}
