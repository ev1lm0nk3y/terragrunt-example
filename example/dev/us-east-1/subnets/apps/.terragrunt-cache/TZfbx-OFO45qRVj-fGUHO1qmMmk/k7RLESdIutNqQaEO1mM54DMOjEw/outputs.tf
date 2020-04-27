output "azs" {
  description = "The availability zones used for the generated subnets"
  value       = slice(data.aws_availability_zones.azs.names, 0, var.num_azs)
}

# TODO(ryan): figure out how to reference this appropriately
#output "ids" {
#  description = "The created subnets ids"
#  value       = aws_subnet.subnets["app-us-east-1a"].id
#}
