module "subnet_addrs" {
  source = "hashicorp/subnets/cidr"

  base_cidr_block = local.vpc_cidr_block

  networks = [
    for index in range(0, var.num_azs) :
    {
      name     = "${var.subnet_name_prefix}-${data.aws_availability_zones.azs.names[index]}"
      new_bits = var.num_azs - 1
    }
  ]
}

resource "aws_subnet" "subnets" {
  for_each = module.subnet_addrs.network_cidr_blocks

  vpc_id = local.vpc_id
  availability_zone = data.aws_availability_zones.azs.names[
  index(keys(module.subnet_addrs.network_cidr_blocks), each.key)]
  cidr_block = each.value

  tags = merge(var.extra_tags, map("Name", each.key))
}
