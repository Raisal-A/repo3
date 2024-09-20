variable "alb_name" {
  description = "The name of the ALB"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID for the ALB"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}
