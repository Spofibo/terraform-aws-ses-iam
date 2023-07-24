################################
# BOUNCES
################################
resource "aws_sns_topic" "bounce_notifications" {
  count = var.enable_bounce_handling ? 1 : 0
  name  = "${var.name_prefix}-bounce-notifications"
}

resource "aws_sns_topic_subscription" "https_bounce_configuration" {
  count     = var.enable_bounce_handling ? 1 : 0
  topic_arn = aws_sns_topic.bounce_notifications[0].arn
  protocol  = "https"
  endpoint  = var.https_bounce_endpoint
}

################################
# COMPLAINTS
################################
resource "aws_sns_topic" "complaint_notifications" {
  count = var.enable_complaint_handling ? 1 : 0
  name  = "${var.name_prefix}-complaint-notifications"
}

resource "aws_sns_topic_subscription" "complaint_notifications_recepients" {
  for_each = {
    for k, v in var.notification_recepients : k => v
    if var.enable_complaint_handling
  }

  topic_arn = aws_sns_topic.complaint_notifications[0].arn
  protocol  = "email"
  endpoint  = each.value
}
