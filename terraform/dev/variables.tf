variable "environment" { default = "dev" }
variable "project" { default = "peculiar-ppv" }
variable "project_billing_id" { default = "PECULIARPPV" }
variable "aws_region" { default = "eu-west-1" }

# RDS
variable "db_engine_type" { default="mysql" }
variable "db_engine_version" { default="5.7" }
