variable "environment" { default = "dev" }
variable "project" { default = "peculiar-ppv" }
variable "project_billing_id" { default = "PECULIARPPV" }
variable "aws_region" { default = "eu-west-1" }
variable "cert_domain" { default = "*.mettalloids.com"}
variable "route_53_zone" { default = "dev.mettalloids.com"}
variable "cluster" { default = "mettalloids"}

variable "http_listener_arn" {
  type = "map"

  default = {
    dev = "arn:aws:elasticloadbalancing:eu-west-1:780172389235:listener/app/mettalloids-dev/2c2e026ae870668e/49e73f5a8e9fe775"
    prod = "arn:aws:elasticloadbalancing:eu-west-1:780172389235:listener/app/mettalloids-prod/df2a714b0665a12c/0f72b1c0fa15cb1a"
  }
}

variable "https_listener_arn" {
  type = "map"

  default = {
    dev = "arn:aws:elasticloadbalancing:eu-west-1:780172389235:listener/app/mettalloids-dev/2c2e026ae870668e/06318349eabb9df7"
    prod = "arn:aws:elasticloadbalancing:eu-west-1:780172389235:listener/app/mettalloids-prod/df2a714b0665a12c/58e01562bf328c86"
  }
}

# RDS
variable "db_engine_type" { default="mysql" }
variable "db_engine_version" { default="5.7" }
