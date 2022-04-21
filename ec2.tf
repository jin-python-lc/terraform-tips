resource "aws_instance" "web" {
  count                       = var.ec2.web_count
  ami                         = var.ec2.ami_id
  instance_type               = var.ec2.web_instance_type
  subnet_id                   = local.protected_subnets[count.index % 2]
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.ec2_web.id]
  iam_instance_profile        = aws_iam_instance_profile.systems_manager.name
  user_data                   = <<EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
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

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "role" {
  name               = "SSMRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy" "systems_manager" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_policy" "ssmpolicy" {
  name        = "ssmpolicy"
  path        = "/"
  description = "ssmpolicy"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ssmmessages:CreateControlChannel",
          "ssmmessages:CreateDataChannel",
          "ssmmessages:OpenControlChannel",
          "ssmmessages:OpenDataChannel"
        ],
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:GetEncryptionConfiguration"
        ],
        "Resource" : "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "default" {
  role       = aws_iam_role.role.name
  policy_arn = data.aws_iam_policy.systems_manager.arn
}

resource "aws_iam_role_policy_attachment" "default2" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.ssmpolicy.arn
}

resource "aws_iam_instance_profile" "systems_manager" {
  name = "MyInstanceProfile"
  role = aws_iam_role.role.name
}