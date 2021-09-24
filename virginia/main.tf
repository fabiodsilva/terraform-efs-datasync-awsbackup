module "efs" {
  source = "./Modules/efs/"

  name        = "efs"
  environment = var.environment
  label_order = var.label_order

  creation_token     = var.token
  region             = var.region
  availability_zones = ["us-east-1a"]
  vpc_id             = "vpc-d4f1e6ae"
  subnets            = ["subnet-a7d21386"]
  security_groups    = ["sg-cf6069ef"]
}


module "aws_backup" {
  source = "./Modules/awsbackup/"

  backup_vault               = "backup_vault_efs"
  backup_plan                = "backup_plan_efs"
  rule_efs                   = "rule_efs"
  schedule_rule              = "cron(0 12 * * ? *)"
  efs_file_system_arn_backup = module.efs.arn
  depends_on                 = [module.efs]
}


