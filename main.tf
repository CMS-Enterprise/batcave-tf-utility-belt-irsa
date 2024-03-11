module "loki_irsa" {
  source                        = "git::git@github.com:CMS-Enterprise/batcave-tf-irsa.git//.?ref=1.0.1"
  role_name                     = "${var.cluster_name}-ub-loki"
  role_path                     = var.iam_path
  role_permissions_boundary_arn = var.permissions_boundary
  app_name                      = var.loki_app_name
  s3_bucket_arns                = var.loki_bucket_arns
  attach_s3_policy              = true
  oidc_providers = {
    main = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = var.loki_service_accounts
    }
  }

}

module "thanos_irsa" {
  source                        = "git::git@github.com:CMS-Enterprise/batcave-tf-irsa.git//.?ref=1.0.1"
  role_name                     = "${var.cluster_name}-ub-thanos"
  role_path                     = var.iam_path
  role_permissions_boundary_arn = var.permissions_boundary
  app_name                      = var.thanos_app_name
  s3_bucket_arns                = var.thanos_bucket_arns
  attach_s3_policy              = true
  oidc_providers = {
    main = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = var.thanos_service_accounts
    }
  }

}

module "velero_irsa" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version                       = "5.3.3"
  role_name                     = "${var.cluster_name}-ub-velero"
  role_path                     = var.iam_path
  role_permissions_boundary_arn = var.permissions_boundary
  velero_s3_bucket_arns         = var.velero_bucket_arns
  attach_velero_policy          = true
  oidc_providers = {
    main = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = var.velero_service_accounts
    }
  }

}

module "argocd_irsa" {
  source                        = "git::git@github.com:CMS-Enterprise/batcave-tf-irsa.git//.?ref=1.0.1"
  role_name                     = "${var.cluster_name}-ub-argocd"
  role_path                     = var.iam_path
  role_permissions_boundary_arn = var.permissions_boundary
  app_name                      = var.argocd_app_name
  sops_arn                      = var.argocd_sops_arn
  attach_sops_policy            = true
  oidc_providers = {
    main = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = var.argocd_service_accounts
    }
  }

}

module "fluentbit_irsa" {
  source                        = "git::git@github.com:CMS-Enterprise/batcave-tf-irsa.git//.?ref=1.0.1"
  role_name                     = "${var.cluster_name}-ub-fluentbit"
  role_path                     = var.iam_path
  role_permissions_boundary_arn = var.permissions_boundary
  app_name                      = var.fluentbit_app_name
  s3_bucket_arns                = var.fluentbit_bucket_arns
  attach_s3_policy              = true
  oidc_providers = {
    main = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = var.fluentbit_service_accounts
    }
  }

}

module "flux_irsa" {
  source                        = "git::git@github.com:CMS-Enterprise/batcave-tf-irsa.git//.?ref=1.0.1"
  role_name                     = "${var.cluster_name}-ub-flux"
  role_path                     = var.iam_path
  role_permissions_boundary_arn = var.permissions_boundary
  app_name                      = var.flux_app_name
  sops_arn                      = var.flux_sops_arn
  attach_sops_policy            = true
  oidc_providers = {
    main = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = var.flux_service_accounts
    }
  }

}

module "container-insights_irsa" {
  source                        = "git::git@github.com:CMS-Enterprise/batcave-tf-irsa.git//.?ref=1.0.1"
  role_name                     = "${var.cluster_name}-ub-container-insights"
  role_path                     = var.iam_path
  role_permissions_boundary_arn = var.permissions_boundary
  app_name                      = var.container-insights_app_name
  attach_insights_policy        = true
  oidc_providers = {
    main = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = var.container-insights_service_accounts
    }
  }

}

module "gitlab_irsa" {
  for_each                      = toset(length(var.gitlab_bucket_arns) > 0 ? ["create"] : [])
  source                        = "git::git@github.com:CMS-Enterprise/batcave-tf-irsa.git//.?ref=1.0.1"
  role_name                     = "${var.cluster_name}-ub-gitlab"
  role_path                     = var.iam_path
  role_permissions_boundary_arn = var.permissions_boundary
  app_name                      = var.gitlab_app_name
  s3_bucket_arns                = var.gitlab_bucket_arns
  attach_s3_policy              = true
  oidc_providers = {
    main = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = var.gitlab_service_accounts
    }
  }

}

module "gitlab_runner_irsa" {
  for_each                      = toset(length(var.gitlab_runner_bucket_arns) > 0 ? ["create"] : [])
  source                        = "git::git@github.com:CMS-Enterprise/batcave-tf-irsa.git//.?ref=1.0.1"
  role_name                     = "${var.cluster_name}-ub-gitlab-runner"
  role_path                     = var.iam_path
  role_permissions_boundary_arn = var.permissions_boundary
  app_name                      = var.gitlab_runner_app_name
  s3_bucket_arns                = var.gitlab_runner_bucket_arns
  attach_s3_policy              = true
  oidc_providers = {
    main = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = var.gitlab_runner_service_accounts
    }
  }

}


module "grafana_irsa" {
  source                        = "git::git@github.com:CMS-Enterprise/batcave-tf-irsa.git//.?ref=1.0.1"
  role_name                     = "${var.cluster_name}-ub-grafana"
  role_path                     = var.iam_path
  role_permissions_boundary_arn = var.permissions_boundary
  app_name                      = var.grafana_app_name
  attach_cloudwatch_policy      = true
  attach_ec2_policy             = true
  attach_tags_policy            = true
  oidc_providers = {
    main = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = var.grafana_service_accounts
    }
  }

}

module "vault_irsa" {
  source                        = "git::git@github.com:CMS-Enterprise/batcave-tf-irsa.git//.?ref=1.0.1"
  role_name                     = "${var.cluster_name}-ub-vault"
  role_path                     = var.iam_path
  role_permissions_boundary_arn = var.permissions_boundary
  app_name                      = var.vault_app_name
  attach_sops_policy            = true
  attach_dynamodb_policy        = true
  sops_arn                      = var.vault_sops_arn
  dynamodb_arn                  = var.vault_dynamodb_arn
  oidc_providers = {
    main = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = var.vault_service_accounts
    }
  }

}

################################################################################
# cosign role using different condition than batcave-tf-irsa
## Setup for cosign keyless signatures
################################################################################

resource "aws_iam_role" "ub_cosign" {
  count = var.create_ub_cosign_iam_role ? 1 : 0

  name = "${var.cluster_name}-ub-cosign"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Principal = {
          Federated = var.oidc_provider_arn
        }
        Condition = {
          StringEquals = {
            "${var.oidc_provider_arn}:aud" : "sigstore",
            "${var.oidc_provider_arn}:sub" : "system:serviceaccount:gitlab-runner:cosign"
          }
        }
      },
    ]
  })
  path                 = var.iam_path
  permissions_boundary = var.permissions_boundary
}
