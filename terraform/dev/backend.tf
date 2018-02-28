terraform {
  backend "s3" {
        bucket = "mettalloids-dev-state-files"
        key = "peculiar-ppv-dev/terraform.tfstate"
        region = "eu-west-1"
        dynamodb_table = "peculiar-ppv-dev-terraform-lock"
        profile = "mt"
  }
}
