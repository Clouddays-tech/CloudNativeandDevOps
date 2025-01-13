# rsg

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"EastUS"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group Name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aks_rg_location"></a> [aks\_rg\_location](#output\_aks\_rg\_location) | n/a |
| <a name="output_aks_rg_name"></a> [aks\_rg\_name](#output\_aks\_rg\_name) | n/a |
<!-- END_TF_DOCS -->
