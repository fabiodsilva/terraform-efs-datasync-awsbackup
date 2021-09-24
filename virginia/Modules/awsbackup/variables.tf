variable "region" {
    type = string
    default = "us-east-1"
}

variable "backup_vault" {
    type = string
}

variable "backup_plan" {
    type = string
}

variable "rule_efs" {
    type = string
}

variable "schedule_rule" {
    type = string
}

variable "efs_file_system_arn_backup" {
    type = string
}
