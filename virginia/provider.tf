terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region  = "us-east-1"
  profile = "lab"
}

provider "aws" {
  region  = "us-east-2"
  profile = "lab"
  alias   = "replica"
}
