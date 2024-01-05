module "loki_irsa" {
  source                        = "git::git@github.com:CMS-Enterprise/batcave-tf-irsa.git//.?ref=1.0.0"
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
  source                        = "git::git@github.com:CMS-Enterprise/batcave-tf-irsa.git//.?ref=1.0.0"
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
