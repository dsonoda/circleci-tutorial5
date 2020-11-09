terraform {
  backend "s3" {
    bucket  = "terraform-states-files-save"
    key     = "tutorial5/vpc/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "terraform"
  }
}

provider "aws" {
  region  = "ap-northeast-1"
  profile = "terraform"
}
