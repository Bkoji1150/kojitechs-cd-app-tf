# kojitechs-cd-app-tf
This pipeline deploy ci infrastructure

<!-- preety ignore start -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=v1.3.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.7.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.16.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.16.1 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.registration_app_db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_secretsmanager_secret.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.registration_app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [aws_security_group.registration-database-sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.db-security_ingress_access_on_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [kubernetes_deployment_v1.ums_deployment](https://registry.terraform.io/providers/hashicorp/kubernetes/2.16.1/docs/resources/deployment_v1) | resource |
| [kubernetes_service_v1.lb_service_nlb](https://registry.terraform.io/providers/hashicorp/kubernetes/2.16.1/docs/resources/service_v1) | resource |
| [kubernetes_service_v1.np_service](https://registry.terraform.io/providers/hashicorp/kubernetes/2.16.1/docs/resources/service_v1) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_eks_cluster_auth.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [terraform_remote_state.kubernetes](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | (optional) describe your variable | `string` | `"ci-cd-demo-eks"` | no |
| <a name="input_component"></a> [component](#input\_component) | Name of the project we are working on | `string` | `"3-tier-architecture"` | no |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | (optional) describe your variable | `string` | `"ci-cd-demo-kojitechs-webapp"` | no |
| <a name="input_container_version"></a> [container\_version](#input\_container\_version) | The image used to start a container. Up to 255 letters (uppercase and lowercase), numbers, hyphens, underscores, colons, periods, forward slashes, and number signs are allowed. | `string` | n/a | yes |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | (optional) describe your variable | `string` | `"webappdb"` | no |
| <a name="input_ecr_account_id"></a> [ecr\_account\_id](#input\_ecr\_account\_id) | (optional) describe your variable | `string` | `"735972722491"` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | (optional) describe your variable | `string` | `"db.t2.micro"` | no |
| <a name="input_port"></a> [port](#input\_port) | (optional) describe your variable | `number` | `3306` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region to deploy action runners | `string` | `"us-east-1"` | no |
| <a name="input_state_bucket"></a> [state\_bucket](#input\_state\_bucket) | target state bucket to deploy action runners | `string` | `"kojitechs.aws.eks.with.terraform.tf"` | no |
| <a name="input_username"></a> [username](#input\_username) | (optional) describe your variable | `string` | `"registeradmin"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_endpoint"></a> [alb\_endpoint](#output\_alb\_endpoint) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- preety ignore end -->

## Authors
This module was build and maintained by [kojibello](kojibello058@gmail.com).
For any further questions you and reach me on [Number](+12024288812)
