
terraform {
  required_version = ">=v1.3.1"

  backend "s3" {
    bucket         = "kojitechs.aws.eks.with.terraform.tf"
    dynamodb_table = "terraform-lock"
    key            = "path/env/kojitechs-cd-app-tf"
    region         = "us-east-1"
    encrypt        = "true"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.16.1"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "= 2.5.1"
    }
  }
}

provider "aws" {
  region = var.region
  assume_role {
    role_arn = "arn:aws:iam::${lookup(var.aws_account_id, terraform.workspace)}:role/Role_For-S3_Creation"
  }
  default_tags {
    tags = module.required_tags.aws_default_tags
  }
}

provider "null" {
}

provider "kubernetes" {
  host                   = local.k8sendpoint
  cluster_ca_certificate = local.cluster_ca_certificate
  token                  = local.token
}

provider "helm" {
  kubernetes {
    host                   = local.k8sendpoint
    cluster_ca_certificate = local.cluster_ca_certificate
    token                  = local.token
  }
}

provider "kubectl" {

  host                   = local.k8sendpoint
  cluster_ca_certificate = local.cluster_ca_certificate
  token                  = local.token
}

data "aws_eks_cluster_auth" "cluster" {
  name = local.cluster_id
}

locals {
  k8sendpoint                                    = aws_eks_cluster.eks_cluster.endpoint
  cluster_id                                     = aws_eks_cluster.eks_cluster.id
  cluster_ca_certificate                         = base64decode(aws_eks_cluster.eks_cluster.certificate_authority[0].data)
  token                                          = data.aws_eks_cluster_auth.cluster.token
  mysql                                          = aws_secretsmanager_secret_version.registration_app
  eks_default_security_group_id                  = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
  openid_connect_provider_arn                    = aws_iam_openid_connect_provider.oidc_provider.arn
  aws_iam_oidc_connect_provider_extract_from_arn = element(split("oidc-provider/", "${aws_iam_openid_connect_provider.oidc_provider.arn}"), 1)
}

module "required_tags" {
  source = "git::https://github.com/Bkoji1150/kojitechs-tf-aws-required-tags.git?ref=v1.0.0"

  line_of_business        = var.line_of_business
  ado                     = var.ado
  tier                    = var.tier
  operational_environment = upper(terraform.workspace)
  tech_poc_primary        = var.tech_poc_primary
  tech_poc_secondary      = var.builder
  application             = var.application
  builder                 = var.builder
  application_owner       = var.application_owner
  vpc                     = var.vpc
  cell_name               = var.cell_name
  component_name          = var.component_name
}

# Kubernetes Service Manifest (Type: Load Balancer)
resource "kubernetes_service_v1" "lb_service_nlb" {
  depends_on = [
    aws_db_instance.registration_app_db,
    aws_eks_cluster.eks_cluster,
    aws_eks_node_group.eks_nodegroup
  ]
  metadata {
    name = "myapp1-service-nlb"
    annotations = {
      "alb.ingress.kubernetes.io/healthcheck-path" = "/"
    }
  }
  spec {
    selector = {
      app = "usermgmt-webapp"
    }
    port {
      name        = "http"
      port        = 80
      target_port = 8080
    }
    type = "LoadBalancer"
  }
}

resource "kubernetes_deployment_v1" "ums_deployment" {
  depends_on = [
    aws_db_instance.registration_app_db,
    aws_eks_cluster.eks_cluster,
    aws_eks_node_group.eks_nodegroup
  ]
  metadata {
    name = "usermgmt-webapp"
    labels = {
      app = "usermgmt-webapp"
    }
  }
  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "usermgmt-webapp"
      }
    }

    template {
      metadata {
        labels = {
          app = "usermgmt-webapp"
        }
      }

      spec {
        container {
          image = format("%s.dkr.ecr.us-east-1.amazonaws.com/%s:%s", var.ecr_account_id, var.container_name, var.container_version)
          name  = "usermgmt-webapp"
          port {
            container_port = "8080"
          }
          env {
            name  = "DB_HOSTNAME"
            value = jsondecode(local.mysql.secret_string)["endpoint"]
          }
          env {
            name  = "DB_PORT"
            value = jsondecode(local.mysql.secret_string)["port"]
          }
          env {
            name  = "DB_PASSWORD"
            value = jsondecode(local.mysql.secret_string)["password"]
          }
          env {
            name  = "DB_NAME"
            value = jsondecode(local.mysql.secret_string)["dbname"]
          }
          env {
            name  = "DB_USERNAME"
            value = jsondecode(local.mysql.secret_string)["username"]
          }
        }
      }
    }
  }
}
