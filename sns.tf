resource "aws_sns_topic" "bounce_notifications" {
  count = var.enable_bounce_handling ? 1 : 0
  name  = "${var.name_prefix}-bounce-notifications"
}

resource "aws_sns_topic_subscription" "mailster_bounce_configuration" {
  topic_arn = aws_sns_topic.bounce_notifications[0].arn
  protocol  = "https"
  endpoint  = var.mailster_bounce_endpoint
}
