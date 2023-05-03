provider "aws" {
  region = var.region
}
module "gitlab" {
  source = "git::https://gitlab.com/gitlab-org/terraform-modules/aws/gitlab-ee?ref=v0.2.2"
  name = var.name
  ssh_key_name = var.ssh_key_name
  ssh_public_key = var.ssh_public_key
  domain_name = var.domain_name
  aws_region = var.region
}
output "gitlab_url" {
  value = "https://${module.gitlab.load_balancer_dns_name}"
}