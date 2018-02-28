variable "environment" { default = "prod" }
variable "project" { default = "picogauge-api" }
variable "project_billing_id" { default = "PICOGAUGE" }
variable "aws_region" { default = "eu-west-1" }

# RDS
variable "db_engine_type" { default="mysql" }
variable "db_engine_version" { default="5.7" }
