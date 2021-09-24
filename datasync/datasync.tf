resource "aws_datasync_task" "efs_datasync_task" {
  destination_location_arn = aws_datasync_location_efs.efsdestination.arn
  name                     = "ReplicationEFS"
  source_location_arn      = aws_datasync_location_efs.efs_source.arn

  schedule {
    schedule_expression = "cron(0 * * * ? *)"
  }

  #excludes {
  #   filter_type = "SIMPLE_PATTERN"
  #   value       = "/folder1|/folder2"
  #}
}




resource "aws_datasync_task" "efs_datasync_task_reverse" {
  destination_location_arn = aws_datasync_location_efs.efs_source.arn
  name                     = "ReplicationEFS"
  source_location_arn      = aws_datasync_location_efs.efsdestination.arn

  schedule {
    schedule_expression = "cron(0 * * * ? *)"
  }

  #excludes {
  #   filter_type = "SIMPLE_PATTERN"
  #   value       = "/folder1|/folder2"
  #}
}


resource "aws_datasync_location_efs" "efs_source" {
  # The below example uses aws_efs_mount_target as a reference to ensure a mount target already exists when resource creation occurs.
  # You can accomplish the same behavior with depends_on or an aws_efs_mount_target data source reference.
  efs_file_system_arn =  data.aws_efs_mount_target.source.file_system_arn

  ec2_config {
    security_group_arns = [data.aws_security_group.source.arn]
    subnet_arn          = data.aws_subnet.source.arn
  }
}


resource "aws_datasync_location_efs" "efsdestination" {
   provider = aws.replica
  # The below example uses aws_efs_mount_target as a reference to ensure a mount target already exists when resource creation occurs.
  # You can accomplish the same behavior with depends_on or an aws_efs_mount_target data source reference.
  efs_file_system_arn = data.aws_efs_mount_target.destination.file_system_arn

  ec2_config {
    security_group_arns = [data.aws_security_group.destination.arn]
    subnet_arn          = data.aws_subnet.destination.arn
  }
}
