resource "aws_backup_vault" "example" {
  name        = var.backup_vault
  # kms_key_arn = aws_kms_key.example.arn
}

resource "aws_backup_plan" "example" {
  name = var.backup_plan

  rule {
    rule_name         = var.rule_efs
    target_vault_name = aws_backup_vault.example.name
    schedule          = var.schedule_rule
  }

}

resource "aws_backup_selection" "example" {
  iam_role_arn = aws_iam_role.example.arn
  name         = "tf_example_backup_selection"
  plan_id      = aws_backup_plan.example.id

  resources = [
    var.efs_file_system_arn_backup,
  ]
}