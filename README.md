# kojitechs-cd-app-tf
This pipeline deploy ci infrastructure

<!-- preety ignore start -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=v1.3.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | = 2.5.1 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.7.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.16.1 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | = 2.5.1 |
| <a name="provider_http"></a> [http](#provider\_http) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.16.1 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_required_tags"></a> [required\_tags](#module\_required\_tags) | git::https://github.com/Bkoji1150/kojitechs-tf-aws-required-tags.git | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.acm_cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_db_instance.registration_app_db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_eks_cluster.eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.eks_nodegroup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_instance_profile.instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_openid_connect_provider.oidc_provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy.externaldns_iam_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.lbc_iam_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.eks_master_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_nodegroup_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.externaldns_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.lbc_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.eks-AmazonEC2ContainerRegistryReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-AmazonEKSClusterPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-AmazonEKSVPCResourceController](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-AmazonEKSWorkerNodePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-AmazonEKS_CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.externaldns_iam_role_policy_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.lbc_iam_role_policy_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.role_policy_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_secretsmanager_secret.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.registration_app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [aws_security_group.registration-database-sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.db-security_ingress_access_on_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [helm_release.external_dns](https://registry.terraform.io/providers/hashicorp/helm/2.5.1/docs/resources/release) | resource |
| [helm_release.loadbalancer_controller](https://registry.terraform.io/providers/hashicorp/helm/2.5.1/docs/resources/release) | resource |
| [kubernetes_cluster_role_binding_v1.eksdeveloper_clusterrolebinding](https://registry.terraform.io/providers/hashicorp/kubernetes/2.16.1/docs/resources/cluster_role_binding_v1) | resource |
| [kubernetes_cluster_role_v1.eksdeveloper_clusterrole](https://registry.terraform.io/providers/hashicorp/kubernetes/2.16.1/docs/resources/cluster_role_v1) | resource |
| [kubernetes_config_map_v1.aws_auth](https://registry.terraform.io/providers/hashicorp/kubernetes/2.16.1/docs/resources/config_map_v1) | resource |
| [kubernetes_deployment_v1.ums_deployment](https://registry.terraform.io/providers/hashicorp/kubernetes/2.16.1/docs/resources/deployment_v1) | resource |
| [kubernetes_ingress_class_v1.ingress_class_default](https://registry.terraform.io/providers/hashicorp/kubernetes/2.16.1/docs/resources/ingress_class_v1) | resource |
| [kubernetes_ingress_v1.ingress](https://registry.terraform.io/providers/hashicorp/kubernetes/2.16.1/docs/resources/ingress_v1) | resource |
| [kubernetes_service_v1.lb_service_nlb](https://registry.terraform.io/providers/hashicorp/kubernetes/2.16.1/docs/resources/service_v1) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_eks_cluster_auth.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [http_http.lbc_iam_policy](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [terraform_remote_state.operational_vpc](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ado"></a> [ado](#input\_ado) | HIDS ADO that owns the resource. The ServiceNow Contracts table is the system of record for the actual ADO names and LOB names. | `string` | `"Kojitechs"` | no |
| <a name="input_application"></a> [application](#input\_application) | Logical name for the application. Mainly used for kojitechs. For an ADO/LOB owned application default to the LOB name. | `string` | `"APP_VPC"` | no |
| <a name="input_application_owner"></a> [application\_owner](#input\_application\_owner) | Email Address of the group who owns the application. This should be a distribution list and no an individual email if at all possible. Primarily used for Ventech-owned applications to indicate what group/department is responsible for the application using this resource. For an ADO/LOB owned application default to the LOB name. | `string` | `"kojitechs@gmail.com"` | no |
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | Environment this template would be deployed to | `map(string)` | `{}` | no |
| <a name="input_builder"></a> [builder](#input\_builder) | The name of the person who created the resource. | `string` | `"kojitechs@gmail.com"` | no |
| <a name="input_cell_name"></a> [cell\_name](#input\_cell\_name) | The name of the cell. | `string` | `"TECH-GLOBAL"` | no |
| <a name="input_cluster_endpoint_private_access"></a> [cluster\_endpoint\_private\_access](#input\_cluster\_endpoint\_private\_access) | Indicates whether or not the Amazon EKS private API server endpoint is enabled. | `bool` | `false` | no |
| <a name="input_cluster_endpoint_public_access"></a> [cluster\_endpoint\_public\_access](#input\_cluster\_endpoint\_public\_access) | Indicates whether or not the Amazon EKS public API server endpoint is enabled. When it's set to `false` ensure to have a proper private access with `cluster_endpoint_private_access = true`. | `bool` | `true` | no |
| <a name="input_cluster_endpoint_public_access_cidrs"></a> [cluster\_endpoint\_public\_access\_cidrs](#input\_cluster\_endpoint\_public\_access\_cidrs) | List of CIDR blocks which can access the Amazon EKS public API server endpoint. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_cluster_service_ipv4_cidr"></a> [cluster\_service\_ipv4\_cidr](#input\_cluster\_service\_ipv4\_cidr) | (optional) describe your variable | `string` | `null` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Kubernetes minor version to use for the EKS cluster (for example 1.21) | `string` | `null` | no |
| <a name="input_component"></a> [component](#input\_component) | Name of the project we are working on | `string` | `"3-tier-architecture"` | no |
| <a name="input_component_name"></a> [component\_name](#input\_component\_name) | (optional) describe your variable | `string` | `"cd-deploy-component"` | no |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | (optional) describe your variable | `string` | `"ci-cd-demo-kojitechs-webapp"` | no |
| <a name="input_container_version"></a> [container\_version](#input\_container\_version) | The image used to start a container. Up to 255 letters (uppercase and lowercase), numbers, hyphens, underscores, colons, periods, forward slashes, and number signs are allowed. | `string` | n/a | yes |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | (optional) describe your variable | `string` | `"webappdb"` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_ecr_account_id"></a> [ecr\_account\_id](#input\_ecr\_account\_id) | (optional) describe your variable | `string` | `"181437319056"` | no |
| <a name="input_eks_oidc_root_ca_thumbprint"></a> [eks\_oidc\_root\_ca\_thumbprint](#input\_eks\_oidc\_root\_ca\_thumbprint) | Thumbprint of Root CA for EKS OIDC, Valid until 2037 | `string` | `"9e99a48a9960b14926bb7f3b02e22da2b0ab7280"` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | (optional) describe your variable | `string` | `"db.t2.micro"` | no |
| <a name="input_line_of_business"></a> [line\_of\_business](#input\_line\_of\_business) | HIDS LOB that owns the resource. | `string` | `"TECH"` | no |
| <a name="input_port"></a> [port](#input\_port) | (optional) describe your variable | `number` | `3306` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region to deploy action runners | `string` | `"us-east-1"` | no |
| <a name="input_state_bucket"></a> [state\_bucket](#input\_state\_bucket) | target state bucket to deploy action runners | `string` | `"kojitechs.aws.eks.with.terraform.tf"` | no |
| <a name="input_tech_poc_primary"></a> [tech\_poc\_primary](#input\_tech\_poc\_primary) | Email Address of the Primary Technical Contact for the AWS resource. | `string` | `"kojitechs@gmail.com"` | no |
| <a name="input_tech_poc_secondary"></a> [tech\_poc\_secondary](#input\_tech\_poc\_secondary) | Email Address of the Secondary Technical Contact for the AWS resource. | `string` | `"kojitechs@gmail.com"` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | Network tier or layer where the resource resides. These tiers are represented in every VPC regardless of single-tenant or multi-tenant. For most resources in the Infrastructure and Security VPC, the TIER will be Management. But in some cases,such as Atlassian, the other tiers are relevant. | `string` | `"APP"` | no |
| <a name="input_username"></a> [username](#input\_username) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | The VPC the resource resides in. We need this to differentiate from Lifecycle Environment due to INFRA and SEC. One of "APP", "INFRA", "SEC", "ROUTING". | `string` | `"APP"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | The Amazon Resource Name (ARN) of the cluster. |
| <a name="output_cluster_certificate_authority_data"></a> [cluster\_certificate\_authority\_data](#output\_cluster\_certificate\_authority\_data) | Nested attribute containing certificate-authority-data for your cluster. This is the base64 encoded certificate data required to communicate with your cluster. |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | The endpoint for your EKS Kubernetes API. |
| <a name="output_cluster_iam_role_arn"></a> [cluster\_iam\_role\_arn](#output\_cluster\_iam\_role\_arn) | IAM role ARN of the EKS cluster. |
| <a name="output_cluster_iam_role_name"></a> [cluster\_iam\_role\_name](#output\_cluster\_iam\_role\_name) | IAM role name of the EKS cluster. |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The name/id of the EKS cluster. |
| <a name="output_cluster_oidc_issuer_url"></a> [cluster\_oidc\_issuer\_url](#output\_cluster\_oidc\_issuer\_url) | The URL on the EKS cluster OIDC Issuer |
| <a name="output_cluster_primary_security_group_id"></a> [cluster\_primary\_security\_group\_id](#output\_cluster\_primary\_security\_group\_id) | The cluster primary security group ID created by the EKS cluster on 1.14 or later. Referred to as 'Cluster security group' in the EKS console. |
| <a name="output_cluster_version"></a> [cluster\_version](#output\_cluster\_version) | The Kubernetes server version for the EKS cluster. |
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | n/a |
| <a name="output_externaldns_iam_role_arn"></a> [externaldns\_iam\_role\_arn](#output\_externaldns\_iam\_role\_arn) | External DNS IAM Role ARN |
| <a name="output_node_group_public_arn"></a> [node\_group\_public\_arn](#output\_node\_group\_public\_arn) | Node Group ARN |
| <a name="output_node_group_public_id"></a> [node\_group\_public\_id](#output\_node\_group\_public\_id) | Node Group ID |
| <a name="output_node_group_public_status"></a> [node\_group\_public\_status](#output\_node\_group\_public\_status) | Public Node Group status |
| <a name="output_node_group_public_version"></a> [node\_group\_public\_version](#output\_node\_group\_public\_version) | Public Node Group status |
| <a name="output_openid_connect_provider_arn"></a> [openid\_connect\_provider\_arn](#output\_openid\_connect\_provider\_arn) | AWS IAM Open ID Connect Provider ARN |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- preety ignore end -->

## Authors
This module was build and maintained by [kojibello](kojibello058@gmail.com).
For any further questions you and reach me on [Number](+12024288812)
