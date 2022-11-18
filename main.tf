terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
      version = "3.19.0"
    }
  }
}

provider "gitlab" {
  token  = var.gitlab_token
}

module "group" {
  source  = "./modules/group"
}
