# terraform

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.0.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_location"></a> [default\_location](#input\_default\_location) | n/a | `string` | `"EastUS"` | no |
| <a name="input_spn-client-id"></a> [spn-client-id](#input\_spn-client-id) | n/a | `string` | n/a | yes |
| <a name="input_spn-client-secret"></a> [spn-client-secret](#input\_spn-client-secret) | n/a | `string` | n/a | yes |
| <a name="input_spn-tenant-id"></a> [spn-tenant-id](#input\_spn-tenant-id) | n/a | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
