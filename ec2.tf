resource "aws_instance" "web" {
  count                       = var.ec2.web_count
  ami                         = var.ec2.ami_id
  instance_type               = var.ec2.web_instance_type
  subnet_id                   = local.protected_subnets[count.index % 2]
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.ec2_web.id]
  user_data = <<EOF
  #!/bin/bash
  yum install -y httpd
  yum install -y mysql
  systemctl start httpd
  systemctl enable httpd
  usermod -a -G apache ec2-user
  chown -R ec2-user:apache /var/www
  chmod 2775 /var/www
  find /var/www -type d -exec chmod 2775 {} \;
  find /var/www -type f -exec chmod 0664 {} \;
  echo `hostname` > /var/www/html/index.html
  EOF
  root_block_device {
    volume_type           = "gp3"
    volume_size           = var.ec2.web_volume_size
    delete_on_termination = true
  }
  tags = merge(local.tags, map("Name", "${local.system_prefix}-ec2-web-${format("%02d", count.index + 1)}"))
  lifecycle {
    ignore_changes = [
      ami
    ]
  }
}