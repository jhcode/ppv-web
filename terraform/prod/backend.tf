terraform {
  backend "s3" {
        bucket = "mettalloids-prod-state-files"
        key = "peculiar-ppv/terraform.tfstate"
        region = "eu-west-1"
        dynamodb_table = "peculiar-ppv-terraform-lock"
        profile = "mt"
  }
}
