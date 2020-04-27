locals {
  acct_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))

  # Extract out common variables for reuse
  env = local.acct_vars.locals.env_name
}

terraform {
  source = "${get_parent_terragrunt_dir()}/../modules/vpc"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  cidr_block = "10.0.0.0/20"
  tags = {
    "Name" = "${local.env}-blue",
    "type" = "example",
  }
}
