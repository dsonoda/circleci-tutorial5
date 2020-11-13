resource "aws_security_group" "instance" {
  name        = "instance"
  description = "instance sg"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
}

resource "aws_security_group_rule" "instance_ingress" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = -1
  source_security_group_id = aws_security_group.alb.id
  security_group_id        = aws_security_group.instance.id
}

resource "aws_security_group_rule" "instance_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.instance.id
}

resource "aws_security_group" "alb" {
  name        = "sample-webapp-alb"
  description = "http and https"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
}

resource "aws_security_group_rule" "alb_ingress" {
  security_group_id = aws_security_group.alb.id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "alb_ingress_ssl" {
  security_group_id = aws_security_group.alb.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "alb_egress" {
  security_group_id = aws_security_group.alb.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group" "db" {
  name        = "sample-db"
  description = "DB"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
}

resource "aws_security_group_rule" "db_ingress" {
  security_group_id        = aws_security_group.db.id
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.instance.id
}
