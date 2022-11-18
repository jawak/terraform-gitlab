terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
      version = "3.19.0"
    }
  }
}

module "sub_group" {
  source = "./sub_group"
}
