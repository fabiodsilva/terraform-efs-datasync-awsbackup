variable "region" {
  default = "us-east-1"
}

variable "environment" {
  default = "test"
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "label order, e.g. `name`,`application`"
}

variable "token" {
  default = "changeme"
}


variable "subnet_source" {
  default = "subnet-a7d21386"
}

