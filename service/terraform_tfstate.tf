data "terraform_remote_state" "aws_iam" {
  backend = "s3"

  config = {
    bucket = "terraform-states-files-save"
    key    = "tutorial5/iam/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "terraform-states-files-save"
    key    = "tutorial5/vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
