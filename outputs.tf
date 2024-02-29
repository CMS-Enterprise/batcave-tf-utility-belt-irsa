output "ub_cosign_iam_role_arn" {
  value = try(aws_iam_role.ub_cosign[0].arn, "")
}
