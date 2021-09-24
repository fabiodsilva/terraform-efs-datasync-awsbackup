
#provider "aws" {
#  region =  "us-east-1"
#  profile = "lab"
#}

provider "aws" {
  region =  "us-east-2"
  profile = "lab"
#  alias = "replica"
}

resource "aws_efs_file_system" "default" {
#  provider                        = aws.replica
  count                           = var.efs_enabled ? 1 : 0
  creation_token                  = var.creation_token
  encrypted                       = var.encrypted
  performance_mode                = var.performance_mode
  provisioned_throughput_in_mibps = var.provisioned_throughput_in_mibps
  throughput_mode                 = var.throughput_mode
  kms_key_id                      = var.kms_key_id
}

resource "aws_efs_mount_target" "default" {
#  provider        = aws.replica
  count           = var.efs_enabled && length(var.availability_zones) > 0 ? length(var.availability_zones) : 0
  file_system_id  = join("", aws_efs_file_system.default.*.id)
  ip_address      = var.mount_target_ip_address
  subnet_id       = var.subnets[count.index]
  security_groups = [join("", aws_security_group.default.*.id)]
}

resource "aws_security_group" "default" {
#  provider    = aws.replica
  count       = var.efs_enabled ? 1 : 0
  name        = "security_group_efs"
  description = "EFS"
  vpc_id      = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }
  ingress {
    from_port       = "2049" 
    to_port         = "2049"
    protocol        = "tcp"
    security_groups = var.security_groups
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
