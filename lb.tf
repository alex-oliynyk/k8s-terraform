#######################################
# Load Balancer
#######################################
resource "aws_lb" "kubernetes_lb" {
  name               = "kubernetes"
  load_balancer_type = "network"
  internal           = false
  subnets            = [aws_subnet.public_subnet.id]
}

#######################################
# Load Balancer target group
#######################################
resource "aws_lb_target_group" "kubernetes_target_group" {
  name     = "kubernetes"
  port     = 6443
  protocol = "TCP"
  vpc_id   = aws_vpc.vpc_kubernetes.id
}

#######################################
# Load Balancer target group attachments
#######################################
resource "aws_lb_target_group_attachment" "lb_attachment_controller_1" {
  target_group_arn = aws_lb_target_group.kubernetes_target_group.arn
  target_id        = aws_instance.controller_0.id
  port             = 6443
}

resource "aws_lb_target_group_attachment" "lb_attachment_controller_2" {
  target_group_arn = aws_lb_target_group.kubernetes_target_group.arn
  target_id        = aws_instance.controller_1.id
  port             = 6443
}

resource "aws_lb_target_group_attachment" "lb_attachment_controller_3" {
  target_group_arn = aws_lb_target_group.kubernetes_target_group.arn
  target_id        = aws_instance.controller_2.id
  port             = 6443
}

#######################################
# Load Balancer listener
#######################################
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.kubernetes_lb.arn
  port              = "443"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.kubernetes_target_group.arn
  }
}

