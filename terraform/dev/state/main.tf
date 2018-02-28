module "backend" {
  source = "git::ssh://git@bitbucket.org/mettalloids/terraform-modules.git//backend"
  project = "${var.project}"
  environment = "${var.environment}"
}

provider "aws" {
  region = "eu-west-1"
  profile = "mt"
}