output "arn" {
  value = aws_vpc.vpc.arn
}

output "cidr_block" {
  value = var.cidr_block
}

output "id" {
  value = aws_vpc.vpc.id
}
