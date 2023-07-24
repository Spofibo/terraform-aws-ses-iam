variable "name_prefix" {
  description = "Name prefix"
  type        = string
}

variable "domain_name" {
  description = "Domain name"
  type        = string
}

variable "enable_bounce_handling" {
  description = "Topic to handle SES bounce notifications"
  type        = bool
  default     = false
}

variable "mailster_bounce_endpoint" {
  description = "Mailster's endpoint for the SNS bounces subscription"
  type        = string
}

variable "enable_complaint_handling" {
  description = "Topic to handle SES complaint notifications"
  type        = bool
  default     = false
}

variable "notification_recepients" {
  description = "A list of emails where to send "
  type        = list(any)
  default     = []
}
