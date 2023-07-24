resource "aws_ses_domain_identity" "this" {
  domain = var.domain_name
}

resource "aws_ses_email_identity" "this" {
  for_each = toset(var.ses_email_identities)
  email    = each.value
}

resource "aws_ses_configuration_set" "bounce" {
  name = "${var.name_prefix}-bounce-configuration"
}

resource "aws_ses_event_destination" "bounce" {
  name                   = "${var.name_prefix}-bounce-sns"
  configuration_set_name = aws_ses_configuration_set.bounce.name
  enabled                = true
  matching_types         = ["bounce"]

  sns_destination {
    topic_arn = aws_sns_topic.bounce_notifications[0].arn
  }
}
