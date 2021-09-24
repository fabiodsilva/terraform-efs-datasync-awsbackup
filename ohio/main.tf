

module "efs_replica" {
  source = "./Modules/efs_replica/"

  name        = "efs_replica"
  environment = var.environment
  label_order = var.label_order

  creation_token     = "changeme1"
  region             = "us-east-2"
  availability_zones = ["us-east-2a"]
  vpc_id             = "vpc-15815c7e"
  subnets            = ["subnet-c8ce0ba3"]
  security_groups    = ["sg-9a1063e2"]
}

module "aws_backup_replica" {
  source = "./Modules/awsbackup_replica/"

  backup_vault               = "backup_vault_efs_replica"
  backup_plan                = "backup_plan_efs_replica"
  rule_efs                   = "rule_efs"
  schedule_rule              = "cron(0 12 * * ? *)"
  efs_file_system_arn_backup = module.efs_replica.arn
#  depends_on                 = [module.efs_replica]
}

