terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
      version = "3.19.0"
    }
  }
}

#Create variable sub group
resource "gitlab_group_variable" "var_sub_group" {
  group             = var.id_sub_group
  key               = "sub_group_variable_key"
  value             = "sub_group_variable_value"
  protected         = false
  masked            = false
  environment_scope = "*"
}

# Create Repository 1
resource "gitlab_project" "repo_example" {
  name         = "Repo Example"
  description  = "An example project"
  namespace_id = var.id_sub_group
}

resource "gitlab_project_environment" "repo_example_env" {
  count   = length(var.var_env)
  project = gitlab_project.repo_example.id
  name    = var.var_env[count.index]
}

# Create Variable Repository ENV Dev
resource "gitlab_project_variable" "repo_example_var_dev" {
  count     = length(var.var_dev)
  project   = gitlab_project.repo_example.id
  key       = var.var_dev[count.index].key
  value     = var.var_dev[count.index].val
  environment_scope = var.var_dev[count.index].scope
}

