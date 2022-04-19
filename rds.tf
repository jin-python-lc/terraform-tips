resource "aws_db_subnet_group" "db_subnetg" {
  name = "${local.system_prefix}-db-subnetg"
  subnet_ids = [aws_subnet.private_a.id, aws_subnet.private_c.id]

  tags = merge(local.tags, map("Name", "${local.system_prefix}-db-subnetg"))
}

resource "aws_db_parameter_group" "db_param" {
  name   = "${local.system_prefix}-rds-pg"
  family = "aurora-mysql5.7"

  tags = merge(local.tags, map("Name", "${local.system_prefix}-rds-pg"))
}

resource "aws_rds_cluster_parameter_group" "db_cluster_param" {
  name    = "${local.system_prefix}-rds-cpg"
  family  = "aurora-mysql5.7"

  parameter {
    name  = "character_set_database"
    value = "utf8"
  }

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "collation_server"
    value = "utf8_general_ci"
  }

  parameter {
    name  = "log_bin_trust_function_creators"
    value = "1"
  }

  parameter {
    name  = "time_zone"
    value = "Asia/Tokyo"
  }

  tags    = merge(local.tags, map("Name", "${local.system_prefix}-rds-clu-pg"))
}

resource "aws_rds_cluster" "db_cluster" {
  cluster_identifier              = "${local.system_prefix}-rds"
  master_username                 = var.rds.username
  master_password                 = var.rds.password
  backup_retention_period         = 7
  preferred_backup_window         = "19:30-20:00"
  preferred_maintenance_window    = "tue:20:15-tue:20:45"
  port                            = 3306
  vpc_security_group_ids          = [aws_security_group.rds.id]
  db_subnet_group_name            = aws_db_subnet_group.db_subnetg.name
  storage_encrypted               = true
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.db_cluster_param.name
  copy_tags_to_snapshot           = true
  engine_version                  = "5.7.mysql_aurora.2.09.2"
  engine                          = "aurora-mysql"
  skip_final_snapshot             = true

  tags = merge(local.tags, map("Name", "${local.system_prefix}-rds-cluster"))
}

resource "aws_rds_cluster_instance" "db_add" {
  count                      = var.stage.short_name == "prd" ? 1 : 0
  identifier                 = "${local.system_prefix}-rds-${format("%02d", count.index + 1)}"
  cluster_identifier         = aws_rds_cluster.db_cluster.id
  instance_class             = var.rds_instance_type
  engine_version             = "5.7.mysql_aurora.2.09.2"
  engine                     = "aurora-mysql"
  auto_minor_version_upgrade = false
  db_parameter_group_name    = aws_db_parameter_group.db_param.name

  tags = merge(local.tags, map("Name", "${local.system_prefix}-rds-${format("%02d", count.index + 1)}"))
}



output "aurora_endpint" {
  value = aws_rds_cluster.db_cluster.endpoint
}
output "aurora_reader_endpint" {
  value = aws_rds_cluster.db_cluster.reader_endpoint
}