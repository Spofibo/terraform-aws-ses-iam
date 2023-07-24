# Terraform module for AWS SES and IAM user configuration
This terraform module creates an SES Domain Identity, an IAM user with its proper policy to interact with SES, and access keys to programmatically access it.

Example usage of this module is to enact the necessary configuration for the Mailster plugin on WordPress.

## Usage

```terraform
module "mysite_ses" {
  source = "github.com/Spofibo/terraform-aws-ses-iam"

  name_prefix          = "prod-mydomain"
  domain_name          = "mydomain.com"
  ses_email_identities = ["hello@mydomain.com"]

  enable_bounce_handling = true
  https_bounce_endpoint  = "https://mydomain.com/?mailster_amazonsns=124125125152"

  enable_complaint_handling = true
  notification_recepients   = ["hello@mydomain.com"]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.9 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.9 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_ses_configuration_set.bounce](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_configuration_set) | resource |
| [aws_ses_domain_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_identity) | resource |
| [aws_ses_email_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_email_identity) | resource |
| [aws_ses_event_destination.bounce](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_event_destination) | resource |
| [aws_sns_topic.bounce_notifications](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic.complaint_notifications](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.complaint_notifications_recepients](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_sns_topic_subscription.https_bounce_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name | `string` | n/a | yes |
| <a name="input_enable_bounce_handling"></a> [enable\_bounce\_handling](#input\_enable\_bounce\_handling) | Topic to handle SES bounce notifications | `bool` | `false` | no |
| <a name="input_enable_complaint_handling"></a> [enable\_complaint\_handling](#input\_enable\_complaint\_handling) | Topic to handle SES complaint notifications | `bool` | `false` | no |
| <a name="input_https_bounce_endpoint"></a> [https\_bounce\_endpoint](#input\_https\_bounce\_endpoint) | HTTPS endpoint for the SNS bounces subscription | `string` | n/a | yes |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Name prefix | `string` | n/a | yes |
| <a name="input_notification_recepients"></a> [notification\_recepients](#input\_notification\_recepients) | A list of emails where to send | `list(string)` | `[]` | no |
| <a name="input_ses_email_identities"></a> [ses\_email\_identities](#input\_ses\_email\_identities) | SES email identities | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_id"></a> [access\_id](#output\_access\_id) | n/a |
| <a name="output_access_secret"></a> [access\_secret](#output\_access\_secret) | n/a |
<!-- END_TF_DOCS -->
