#######################################
# Public subnet
#######################################
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc_kubernetes.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name      = "kubernetes"
  }
}