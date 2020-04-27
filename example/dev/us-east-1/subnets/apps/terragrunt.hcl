locals {
  account_info = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_info = read_terragrunt_config(find_in_parent_folders("region.hcl"))

  env_name = local.account_info.locals.env_name
  region   = local.region_info.locals.region
  vpc_name = "blue"
}

dependencies {
  paths = [
    "../../vpc/${local.vpc_name}",
  ]
}

terraform {
  source = "${get_parent_terragrunt_dir()}/../modules/subnet"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  # remote_state_key = "${local.env_name}/${local.region}/vpc/${local.vpc_name}"
  subnet_name_prefix = "apps"
  vpc_name = local.vpc_name
}
