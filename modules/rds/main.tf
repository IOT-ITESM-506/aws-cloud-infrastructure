provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "My VPC for RDS"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "My Subnet for RDS"
  }
}

resource "aws_db_subnet_group" "my_postgres_subnet_group" {
  name       = "my-postgres-subnet-group"
  subnet_ids = [aws_subnet.my_subnet.id]

  tags = {
    Name = "My Postgres Subnet Group"
  }
}

resource "aws_security_group" "my_postgres_sg" {
  vpc_id = aws_vpc.my_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["187.189.165.97/32"]
  }

  tags = {
    Name = "My Postgres Security Group"
  }
}

resource "aws_db_instance" "my_postgres" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "13.3"
  instance_class       = "db.t2.micro"
  username             = "postgresadmin"
  password             = "yoursecurepassword"
  parameter_group_name = "default.postgres13"
  skip_final_snapshot  = true
  db_name               = "mydbname"

  db_subnet_group_name   = aws_db_subnet_group.my_postgres_subnet_group.name
  vpc_security_group_ids = [aws_security_group.my_postgres_sg.id]

  tags = {
    Name = "My Postgres DB"
  }
}
