#######################################
# Security group
#######################################
resource "aws_security_group" "sg_kubernetes" {
  name        = "sg_kubernetes"
  vpc_id      = aws_vpc.vpc_kubernetes.id

  tags = {
    Name = "sg_kubernetes"
  }
}


#######################################
# Security group rules
#######################################
resource "aws_security_group_rule" "egress_traffic" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  self              = null
  prefix_list_ids   = null
  security_group_id = aws_security_group.sg_kubernetes.id
}

resource "aws_security_group_rule" "ingress_from_VPC" {
  type              = "ingress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = [aws_vpc.vpc_kubernetes.cidr_block]
  self              = null
  prefix_list_ids   = null
  security_group_id = aws_security_group.sg_kubernetes.id
}

resource "aws_security_group_rule" "ingress_from_K8s_cluster" {
  type              = "ingress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["10.200.0.0/16"]
  self              = null
  prefix_list_ids   = null
  security_group_id = aws_security_group.sg_kubernetes.id
}

resource "aws_security_group_rule" "ingress_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  self              = null
  prefix_list_ids   = null
  security_group_id = aws_security_group.sg_kubernetes.id
}

resource "aws_security_group_rule" "ingress_kube_api" {
  type              = "ingress"
  from_port         = 6443
  to_port           = 6443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  self              = null
  prefix_list_ids   = null
  security_group_id = aws_security_group.sg_kubernetes.id
}

resource "aws_security_group_rule" "ingress_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  self              = null
  prefix_list_ids   = null
  security_group_id = aws_security_group.sg_kubernetes.id
}

resource "aws_security_group_rule" "ingress_icmp" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  self              = null
  prefix_list_ids   = null
  security_group_id = aws_security_group.sg_kubernetes.id
}