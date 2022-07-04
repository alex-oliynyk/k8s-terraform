#######################################
# Controllers
#######################################
resource "aws_instance" "controller_0" {
  ami                         = "ami-0fb653ca2d3203ac1"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  key_name                    = "kubernetes"
  vpc_security_group_ids      = [aws_security_group.sg_kubernetes.id]
  private_ip                  = "10.0.1.10"
  user_data                   = "name=controller-0"
  subnet_id                   = aws_subnet.public_subnet.id
  source_dest_check           = false

  tags = {
    Name = "controller-0"
  }
}

resource "aws_instance" "controller_1" {
  ami                         = "ami-0fb653ca2d3203ac1"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  key_name                    = "kubernetes"
  vpc_security_group_ids      = [aws_security_group.sg_kubernetes.id]
  private_ip                  = "10.0.1.11"
  user_data                   = "name=controller-1"
  subnet_id                   = aws_subnet.public_subnet.id
  source_dest_check           = false

  tags = {
    Name = "controller-1"
  }
}

resource "aws_instance" "controller_2" {
  ami                         = "ami-0fb653ca2d3203ac1"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  key_name                    = "kubernetes"
  vpc_security_group_ids      = [aws_security_group.sg_kubernetes.id]
  private_ip                  = "10.0.1.12"
  user_data                   = "name=controller-2"
  subnet_id                   = aws_subnet.public_subnet.id
  source_dest_check           = false

  tags = {
    Name = "controller-2"
  }
}

#######################################
# Workers
#######################################

resource "aws_instance" "worker_0" {
  ami                         = "ami-0fb653ca2d3203ac1"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  key_name                    = "kubernetes"
  vpc_security_group_ids      = [aws_security_group.sg_kubernetes.id]
  private_ip                  = "10.0.1.20"
  user_data                   = "name=worker-0|pod-cidr=10.200.0.0/24"
  subnet_id                   = aws_subnet.public_subnet.id
  source_dest_check           = false

  tags = {
    Name = "worker-0"
  }
}

resource "aws_instance" "worker_1" {
  ami                         = "ami-0fb653ca2d3203ac1"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  key_name                    = "kubernetes"
  vpc_security_group_ids      = [aws_security_group.sg_kubernetes.id]
  private_ip                  = "10.0.1.21"
  user_data                   = "name=worker-1|pod-cidr=10.200.1.0/24"
  subnet_id                   = aws_subnet.public_subnet.id
  source_dest_check           = false

  tags = {
    Name = "worker-1"
  }
}

resource "aws_instance" "worker_2" {
  ami                         = "ami-0fb653ca2d3203ac1"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  key_name                    = "kubernetes"
  vpc_security_group_ids      = [aws_security_group.sg_kubernetes.id]
  private_ip                  = "10.0.1.22"
  user_data                   = "name=worker-2|pod-cidr=10.200.2.0/24"
  subnet_id                   = aws_subnet.public_subnet.id
  source_dest_check           = false

  tags = {
    Name = "worker-2"
  }
}