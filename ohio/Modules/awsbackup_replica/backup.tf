provider "aws" {
  region =  "us-east-2"
  profile = "lab"
#  alias = "replica"
}

resource "aws_backup_vault" "example" {
#  provider                        = aws.replica
  name        = var.backup_vault
  # kms_key_arn = aws_kms_key.example.arn
}

resource "aws_backup_plan" "example" {
#  provider                        = aws.replica
  name = var.backup_plan

  rule {
    rule_name         = var.rule_efs
    target_vault_name = aws_backup_vault.example.name
    schedule          = var.schedule_rule
  }

}

resource "aws_backup_selection" "example" {
#  provider                        = aws.replica
  iam_role_arn = aws_iam_role.example_replica.arn
  name         = "tf_example_backup_selection"
  plan_id      = aws_backup_plan.example.id

  resources = [
    var.efs_file_system_arn_backup,
  ]
}
