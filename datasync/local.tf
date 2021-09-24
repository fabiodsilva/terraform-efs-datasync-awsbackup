provider "aws" {
  profile = "lab"
  region  = "us-east-1"
}

provider "aws" {
  region  =  "us-east-2"
  profile = "lab"
  alias   = "replica"
}


locals {
 
  subnetsource      = "subnet-a7d21386" 
  subnetdestination = "subnet-c8ce0ba3"
  asgsource         = "sg-cf6069ef"
  asgdestination    = "sg-9a1063e2"
  mtdestination     = "fs-1c835967"
  mtsource          = "fs-8d545d39"
}
