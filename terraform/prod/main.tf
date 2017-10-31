provider "aws" {
  region = "eu-west-1"
  profile = "mt"
}

provider "ignition" {
  version = "0.1.0"
}

module "efs" {
  source = "git::https://bitbucket.org/mettalloids/terraform-modules//efs"
  performance_mode = "maxIO"
  aws_region = "eu-west-1"
  subnets = "${split(",", var.subnets)}"
  internal_sg_id = "${aws_security_group.internal.id}"
  cluster_name = "${var.ecs_cluster_name}"
  project_billing_id = "${var.project_billing_id}"
}
