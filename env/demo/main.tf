provider "aws" {
  region  = var.region
  profile = var.aws_profile
}

terraform {
  backend "s3" {
    encrypt = "true"
    bucket  = "tfstates-271311908464"
    key     = "demo/terraform.tfstate"
    region  = "us-east-1"
    profile = "MYAWSNEW"
  }
}
