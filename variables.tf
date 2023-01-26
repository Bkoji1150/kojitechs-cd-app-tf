
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
  default     = "registeradmin"
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
  default     = "735972722491"
}

variable "cluster_name" {
  type        = string
  description = "(optional) describe your variable"
  default     = "ci-cd-demo-eks"
}
