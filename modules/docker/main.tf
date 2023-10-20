module "ecr_module" {
  source                = "./ecr" 
  region                = "us-east-1"
  ecr_repository_name   = "django-app-repo"
}

output "ecr_repository_url" {
  value = module.ecr_module.ecr_repository_url
}