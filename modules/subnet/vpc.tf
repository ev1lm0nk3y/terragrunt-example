data "terraform_remote_state" "vpc" {
  count   = var.vpc_id == "" ? 1 : 0
  backend = "s3"

  config = {
    bucket = var.remote_state_bucket
    key    = "${var.region}/vpc/${var.vpc_name}"
    region = var.region
  }
}

locals {
  vpc_id = element(concat(list(var.vpc_id),
  data.terraform_remote_state.vpc[*].outputs["id"]), 0)

  vpc_cidr_block = element(concat(list(var.vpc_cidr_block),
  data.terraform_remote_state.vpc[*].outputs["cidr_block"]), 0)
}
