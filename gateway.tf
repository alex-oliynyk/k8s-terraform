#######################################
# Internet gateway
#######################################
resource "aws_internet_gateway" "kubernetes_gateway" {
  vpc_id = aws_vpc.vpc_kubernetes.id

  tags = {
    Name = "kubernetes"
  }
}


#######################################
# Route table and association with VPC
#######################################
resource "aws_route_table" "kubernetes_route_table" {
  vpc_id = aws_vpc.vpc_kubernetes.id

  tags = {
    Name = "kubernetes"
  }
}

resource "aws_route" "kubernetes_default_route" {
  route_table_id          = aws_route_table.kubernetes_route_table.id
  destination_cidr_block  = "0.0.0.0/0"
  gateway_id              = aws_internet_gateway.kubernetes_gateway.id
}

resource "aws_route" "kubernetes_instance_0" {
  route_table_id          = aws_route_table.kubernetes_route_table.id
  destination_cidr_block  = "10.200.0.0/24"
  instance_id             = aws_instance.worker_0.id
}

resource "aws_route" "kubernetes_instance_1" {
  route_table_id          = aws_route_table.kubernetes_route_table.id
  destination_cidr_block  = "10.200.1.0/24"
  instance_id             = aws_instance.worker_1.id
}

resource "aws_route" "kubernetes_instance_2" {
  route_table_id          = aws_route_table.kubernetes_route_table.id
  destination_cidr_block  = "10.200.2.0/24"
  instance_id             = aws_instance.worker_2.id
}

resource "aws_main_route_table_association" "vpc_route_table_association" {
  vpc_id         = aws_vpc.vpc_kubernetes.id
  route_table_id = aws_route_table.kubernetes_route_table.id
}