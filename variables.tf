
variable "state_bucket" {
  type        = string
  description = "target state bucket to deploy action runners"
  default     = "kojitechs.aws.eks.with.terraform.tf"
}

variable "region" {
  type        = string
  description = "AWS region to deploy action runners"
  default     = "us-east-1"
}

variable "component" {
  type        = string
  description = "Name of the project we are working on"
  default     = "3-tier-architecture"
}

variable "db_name" {
  type        = string
  description = "(optional) describe your variable"
  default     = "webappdb" # MUST HAVE THIS NAME
}

variable "username" {
  type        = string
  description = "(optional) describe your variable"
}

variable "port" {
  type        = number
  description = "(optional) describe your variable"
  default     = 3306
}

variable "container_name" {
  type        = string
  description = "(optional) describe your variable"
  default     = "ci-cd-demo-kojitechs-webapp"
}

variable "container_version" {
  type        = string
  description = "The image used to start a container. Up to 255 letters (uppercase and lowercase), numbers, hyphens, underscores, colons, periods, forward slashes, and number signs are allowed."
}

variable "instance_class" {
  type        = string
  description = "(optional) describe your variable"
  default     = "db.t2.micro"
}

variable "ecr_account_id" {
  type        = string
  description = "(optional) describe your variable"
  default     = "181437319056"
}

###### EKS CLUSTER VARIABLES
variable "cluster_version" {
  description = "Kubernetes minor version to use for the EKS cluster (for example 1.21)"
  type        = string
  default     = null
}
variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
  type        = bool
  default     = false
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled. When it's set to `false` ensure to have a proper private access with `cluster_endpoint_private_access = true`."
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "cluster_service_ipv4_cidr" {
  type        = string
  description = "(optional) describe your variable"
  default     = null
}

variable "component_name" {
  type        = string
  description = "(optional) describe your variable"
  default     = "cd-deploy-component"
}

variable "aws_account_id" {
  description = "Environment this template would be deployed to"
  type        = map(string)
  default     = {}
}

# tags variables 
variable "line_of_business" {
  description = "HIDS LOB that owns the resource."
  type        = string
  default     = "TECH"
}

variable "ado" {
  description = "HIDS ADO that owns the resource. The ServiceNow Contracts table is the system of record for the actual ADO names and LOB names."
  type        = string
  default     = "Kojitechs"
}

variable "tier" {
  description = "Network tier or layer where the resource resides. These tiers are represented in every VPC regardless of single-tenant or multi-tenant. For most resources in the Infrastructure and Security VPC, the TIER will be Management. But in some cases,such as Atlassian, the other tiers are relevant."
  type        = string
  default     = "APP"
}

variable "tech_poc_primary" {
  description = "Email Address of the Primary Technical Contact for the AWS resource."
  type        = string
  default     = "kojitechs@gmail.com"
}

variable "tech_poc_secondary" {
  description = "Email Address of the Secondary Technical Contact for the AWS resource."
  type        = string
  default     = "kojitechs@gmail.com"
}

variable "application" {
  description = "Logical name for the application. Mainly used for kojitechs. For an ADO/LOB owned application default to the LOB name."
  type        = string
  default     = "APP_VPC"
}

variable "builder" {
  description = "The name of the person who created the resource."
  type        = string
  default     = "kojitechs@gmail.com"
}

variable "application_owner" {
  description = "Email Address of the group who owns the application. This should be a distribution list and no an individual email if at all possible. Primarily used for Ventech-owned applications to indicate what group/department is responsible for the application using this resource. For an ADO/LOB owned application default to the LOB name."
  default     = "kojitechs@gmail.com"
}

variable "vpc" {
  description = "The VPC the resource resides in. We need this to differentiate from Lifecycle Environment due to INFRA and SEC. One of \"APP\", \"INFRA\", \"SEC\", \"ROUTING\"."
  type        = string
  default     = "APP"
}

variable "cell_name" {
  description = "The name of the cell."
  type        = string
  default     = "TECH-GLOBAL"
}

variable "domain_name" {
  type        = string
  description = "(optional) describe your variable"
}

# EKS OIDC ROOT CA Thumbprint - valid until 2037
variable "eks_oidc_root_ca_thumbprint" {
  type        = string
  description = "Thumbprint of Root CA for EKS OIDC, Valid until 2037"
  default     = "9e99a48a9960b14926bb7f3b02e22da2b0ab7280"
}
