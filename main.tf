
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
  }
}

provider "aws" {
  region = var.region
}

provider "kubernetes" {
  host                   = local.k8sendpoint
  cluster_ca_certificate = local.cluster_ca_certificate
  # token                  = local.token
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", local.kubernetes_cert.cluster_id]
    command     = "aws"
  }
}

provider "kubectl" {

  host                   = local.k8sendpoint
  cluster_ca_certificate = local.cluster_ca_certificate
  token                  = local.token
  load_config_file       = "false"
}

data "terraform_remote_state" "kubernetes" {
  backend = "s3"

  config = {
    region = var.region
    bucket = var.state_bucket
    key    = "path/env/kojitechs-ci-cd-demo-infra-pipeline-tf"
  }
}

data "aws_eks_cluster_auth" "cluster" {
  name = local.cluster_id
}

locals {
  vpc_id                 = data.terraform_remote_state.kubernetes.outputs.vpc_id
  kubernetes_cert        = data.terraform_remote_state.kubernetes.outputs
  k8sendpoint            = local.kubernetes_cert.cluster_endpoint
  certificate_authority  = local.kubernetes_cert.cluster_certificate_authority_data
  cluster_id             = local.kubernetes_cert.cluster_id
  cluster_ca_certificate = base64decode(local.certificate_authority)
  token                  = data.aws_eks_cluster_auth.cluster.token
  mysql                  = aws_secretsmanager_secret_version.registration_app
}

# Kubernetes Service Manifest (Type: Node Port Service)
resource "kubernetes_service_v1" "np_service" {
  depends_on = [aws_db_instance.registration_app_db]
  metadata {
    name = "usermgmt-webapp-np-service"
  }
  spec {
    selector = {
      app = kubernetes_deployment_v1.ums_deployment.spec.0.selector.0.match_labels.app
    }
    port {
      name        = "http"
      port        = 80
      target_port = 8080
      node_port   = 31280
    }
    type = "NodePort"
  }
}

# Kubernetes Service Manifest (Type: Load Balancer)
resource "kubernetes_service_v1" "lb_service_nlb" {
  depends_on = [aws_db_instance.registration_app_db]
  metadata {
    name = "myapp1-service-nlb"
    annotations = {
      "service.beta.kubernetes.io/aws-load-balancer-type" = "nlb" # To create Network Load Balancer  
    }
  }
  spec {
    selector = {
      app = kubernetes_deployment_v1.ums_deployment.spec.0.selector.0.match_labels.app
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
  depends_on = [aws_db_instance.registration_app_db]
  metadata {
    name = "usermgmt-webapp"
    labels = {
      app = "usermgmt-webapp"
    }
  }
  spec {
    replicas = 1

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
