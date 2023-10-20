provider "aws" {
  region = "us-east-1"  
}

variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
}

variable "db_username" {
  description = "Nombre de usuario de la base de datos"
  type        = string
}

variable "db_password" {
  description = "Contraseña de la base de datos"
  type        = string
}

resource "aws_db_instance" "database" {
  identifier           = var.db_name
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "13.12"
  instance_class       = "db.t3.micro"
  username             = var.db_username
  password             = var.db_password
  publicly_accessible  = true
}

output "db_endpoint" {
  description = "Endpoint de la base de datos"
  value       = aws_db_instance.database.endpoint
}
