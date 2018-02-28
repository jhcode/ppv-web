provider "credstash" {
  table  = "credential-store"
  region = "eu-west-1"
}

provider "aws" {
  region = "eu-west-1"
  profile = "mt"
}