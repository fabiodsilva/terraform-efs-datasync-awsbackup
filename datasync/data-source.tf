
data "aws_subnet" "source" {
  id = local.subnetsource
}

data "aws_subnet" "destination" {
  provider = aws.replica
  id = local.subnetdestination
}

data "aws_security_group" "source" {
   id = local.asgsource
}

data "aws_security_group" "destination" {
  provider = aws.replica
  id = local.asgdestination
}

data "aws_efs_mount_target" "source" {
   file_system_id = local.mtsource
}

data "aws_efs_mount_target" "destination" {
  provider = aws.replica
  file_system_id = local.mtdestination
}