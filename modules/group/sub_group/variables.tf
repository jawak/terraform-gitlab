variable "id_sub_group" {
  default = "60494461"
}

variable "var_env" {
  type = list(string)
  default = ["dev","staging","prod"]
}

variable "var_dev" {
  type = list(object({
    key = string
    val = string
    scope = string
  }))
  sensitive = true
  default = [
    {
      key = "var_1"
      val = "val 1"
      scope = "dev"
    },
    {
      key = "var_2"
      val = "var 2"
      scope = "dev"
    }
  ]
}
