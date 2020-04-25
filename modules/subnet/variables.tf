variable "extra_tags" {
  default     = {}
  description = "A map of other tags to add to the created subnets"
  type        = map
}

variable "num_azs" {
  default     = 3
  description = "Number of consecutive availability zones to place the subnet(s) in"
  type        = number
}

variable "region" {
  description = "The region in which to place the subnet(s)"
  type        = string
}

variable "remote_state_bucket" {
  default     = ""
  description = "Bucket name where terraform remote state is stored"
  type        = string
}

variable "subnet_name_prefix" {
  description = "The prefix to use when naming the subnet(s)"
  type        = string
}

variable "vpc_name" {
  description = "The value of the Name tag of the VPC"
  type        = string
}

variable "vpc_id" {
  default     = ""
  description = "The AWS VPC ID. Will not check the VPC remote state file"
  type        = string
}

variable "vpc_cidr_block" {
  default     = ""
  description = "The AWC VPC CIDR block. Used only if the remote state file is not checked"
  type        = string
}
