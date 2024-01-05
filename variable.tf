
variable "iam_path" {
  description = "Path of IAM role"
  type        = string
  default     = "/delegatedadmin/developer/"
}

variable "permissions_boundary" {
  description = "Permissions boundary ARN to use for IAM role"
  type        = string
}
variable "oidc_provider_arn" {
  type = string
}
variable "cluster_name" {
  type = string
}
variable "loki_bucket_arns" {
  type        = list(string)
  description = "buckets for Loki"
}
variable "loki_app_name" {
  type    = string
  default = "loki"
}
variable "loki_service_accounts" {
  type    = list(string)
  default = ["logging:logging-loki"]
}
variable "thanos_bucket_arns" {
  type        = list(string)
  description = "buckets for thanos"
}
variable "thanos_app_name" {
  type    = string
  default = "thanos"
}
variable "thanos_service_accounts" {
  type = list(string)
  default = [
    "monitoring:thanos-storegateway",
    "monitoring:prometheus",
  ]
}

variable "velero_bucket_arns" {
  type        = list(string)
  description = "buckets for velero"
}
variable "velero_service_accounts" {
  type    = list(string)
  default = ["velero:velero-velero-server"]
}
