
variable "iam_path" {
  description = "Path of IAM role"
  type        = string
  default     = ""
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
    "thanos:thanos-storegateway",
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

variable "argocd_sops_arn" {
  type        = string
  description = "sops kms key arn for argocd"
}
variable "argocd_app_name" {
  type    = string
  default = "ArgoCD"
}
variable "argocd_service_accounts" {
  type = list(string)
  default = [
    "argocd:argocd-application-controller",
    "argocd:argocd-argocd-repo-server",
    "argocd:argocd-server"
  ]
}

variable "fluentbit_bucket_arns" {
  type        = list(string)
  description = "buckets for fluentbit"
}
variable "fluentbit_app_name" {
  type    = string
  default = "Fluentbit"
}
variable "fluentbit_service_accounts" {
  type    = list(string)
  default = ["fluentbit:fluentbit-fluent-bit"]
}

variable "flux_sops_arn" {
  type        = string
  description = "sops kms key arn for flux"
}
variable "flux_app_name" {
  type    = string
  default = "Flux"
}
variable "flux_service_accounts" {
  type    = list(string)
  default = ["flux-system:kustomize-controller"]
}


variable "container-insights_app_name" {
  type    = string
  default = "container-insights"
}
variable "container-insights_service_accounts" {
  type        = list(string)
  default     = ["container-insights:aws-cloudwatch-metrics"]
  description = "service accounts for container-insights in form of namespace:service-account"
}

variable "gitlab_bucket_arns" {
  type        = list(string)
  description = "buckets for gitlab"
  default     = []
}
variable "gitlab_app_name" {
  type    = string
  default = "GitLab"
}
variable "gitlab_service_accounts" {
  type = list(string)
  default = [
    "gitlab:gitlab-minio",
    "gitlab:gitlab-webservice",
    "gitlab:gitlab-toolbox",
    "gitlab:gitlab-sidekiq"
  ]
}

variable "gitlab_runner_bucket_arns" {
  type        = list(string)
  description = "buckets for gitlab_runner"
  default     = []
}
variable "gitlab_runner_app_name" {
  type    = string
  default = "GitlabRunner"
}
variable "gitlab_runner_service_accounts" {
  type    = list(string)
  default = ["gitlab-runner:gitlab-runner"]
}

variable "grafana_app_name" {
  type    = string
  default = "Grafana"
}
variable "grafana_service_accounts" {
  type = list(string)
  default = [
    "monitoring:monitoring-grafana",
    "monitoring:monitoring-monitoring-kube-alertmanager",
    "monitoring:monitoring-monitoring-kube-operator",
    "monitoring:monitoring-monitoring-kube-state-metrics",
    "monitoring:monitoring-monitoring-prometheus-node-exporter"
  ]
}

variable "create_ub_cosign_iam_role" {
  description = "Flag to create Cosign IAM role"
  default     = false
  type        = bool
}

variable "vault_sops_arn" {
  type        = string
  description = "sops kms key arn for vault"
}

variable "vault_dynamodb_arn" {
  type        = string
  description = "dynamodb database arn for vault"
}
variable "vault_app_name" {
  type    = string
  default = "vault"
}
variable "vault_service_accounts" {
  type    = list(string)
  default = ["vault:vault-sa"]
}

variable "defectdojo_app_name" {
  type    = string
  default = "defectdojo"
}
variable "defectdojo_service_accounts" {
  type    = list(string)
  default = ["defectdojo:defectdojo"]
}
variable "defectdojo_bucket_arns" {
  type        = list(string)
  description = "buckets for defectdojo"
  default     = []
}
