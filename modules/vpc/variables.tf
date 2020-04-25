variable "cidr_block" {
  description = "CIDR blaock to assign to the VPC"
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to associate with the VPC"
  type        = map
}
