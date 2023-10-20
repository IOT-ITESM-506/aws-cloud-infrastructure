provider "aws" {
  region = "us-east-1"  
}

module "ecr_module" {
  source = "./ecr"
  region = "us-east-1" 
}

module "ecs_module" {
  source = "./ecs"

  cluster_name       = "your-ecs-cluster"
  task_family        = "your-task-family"
  container_name     = "your-container"
  container_port     = 80  # Cambia al puerto correcto
  host_port          = 8080  # Cambia al puerto correcto
  memory             = 512  # Cambia según tus requisitos
  cpu                = 256  # Cambia según tus requisitos
  service_name       = "your-ecs-service"
  subnets            = ["subnet-xxxxxx", "subnet-yyyyyy"] 
  security_groups    = ["sg-xxxxxx"] 
}

output "ecs_service_name" {
  value = module.ecs_module.ecs_service_name
}

output "ecs_cluster_id" {
  value = module.ecs_module.ecs_cluster_id
}

output "ecr_repository_url" {
  value = module.ecr_module.ecr_repository_url
}
