variable "environment" { default = "prod" }
variable "project" { default = "peculiar-ppv" }
variable "project_billing_id" { default = "PECULIAR" }
variable "aws_region" { default = "eu-west-1" }

# RDS
variable "db_engine_type" { default="mysql" }
variable "db_engine_version" { default="5.7" }
