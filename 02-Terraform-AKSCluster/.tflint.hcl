plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

plugin "azurerm" {
    enabled = true
    version = "0.27.0"
    source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}


config {
  format = "compact"
  call_module_type = "all"

  # plugin_dir = "~/.tflint.d/plugins"
  # call_module_type = "local"
  # force = false
  # disabled_by_default = false

  ignore_module = {
    "terraform-aws-modules/vpc/aws"            = true
    "terraform-aws-modules/security-group/aws" = true
  }

#   varfile = ["terraform.tfvars", "terraform.tfvars"]
#   variables = ["foo=bar", "bar=[\"baz\"]"]
}

# plugin "aws" {
#   enabled = true
#   version = "0.4.0"
#   source  = "github.com/terraform-linters/tflint-ruleset-aws"
# }

rule "terraform_required_providers" {
  enabled = false
}

rule "terraform_required_version" {
  enabled = false
}
# ignore_rule "terraform_required_version" {}