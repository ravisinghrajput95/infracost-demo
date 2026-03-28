resource "aws_instance" "demo_instance" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = var.instance_type
  subnet_id     = aws_subnet.demo_subnet.id
  vpc_security_group_ids = [aws_security_group.demo_sg.id]

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  tags = {
    Name        = "demo-ec2"
    Environment = var.environment
    Project     = "finops-demo"
  }
}
