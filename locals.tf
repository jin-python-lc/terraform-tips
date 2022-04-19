locals {
  system_prefix = "${var.project.name}-${var.stage.short_name}"
  tags = {
    Env     = var.stage.name
    Stage   = var.stage.name
    Project = var.stage.name
  }
  protected_subnets = {
    "0" = aws_subnet.protected_a.id
    "1" = aws_subnet.protected_c.id
  }
  bucket = "tfstates-depot-bucket-poc"
}
