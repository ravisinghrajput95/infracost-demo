resource "aws_db_instance" "demo_rds" {
  identifier         = "finops-demo-db"
  engine             = "mysql"
  instance_class     = "db.t3.medium"
  allocated_storage  = 20
  storage_type       = "gp2"

  username = "admin"
  password = "password123"

  skip_final_snapshot = true

  tags = {
    Environment = var.environment
    Project     = "finops-demo"
  }
}
