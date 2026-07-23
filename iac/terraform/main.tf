module "networking" {

  source = "./modules/networking"

  project_name = var.project_name

  environment = var.environment

  vpc_cidr = var.vpc_cidr

  availability_zones = var.availability_zones

  public_subnets = var.public_subnets

  private_subnets = var.private_subnets

  redis_subnets = var.redis_subnets

}

module "dynamodb" {

  source = "./modules/dynamodb"

  project_name = var.project_name

  environment = var.environment

}

module "sqs" {

  source = "./modules/sqs"

  project_name = var.project_name

  environment = var.environment

}

module "ecr" {

  source = "./modules/ecr"

  project_name = var.project_name

  environment = var.environment

}

module "rds" {

  source = "./modules/rds"

  project_name = var.project_name

  environment = var.environment

  rds_subnet_group_name = module.networking.rds_subnet_group_name

  rds_security_group_id = module.networking.rds_security_group_id

  secret_name = "postgres_credentials"

}

# module "redis" {

#   source = "./modules/redis"

#   project_name = var.project_name

#   environment = var.environment

#   redis_subnet_ids = module.networking.redis_subnet_ids

#   redis_security_group_id = module.networking.redis_security_group_id

# }

# module "eks" {

#   source = "./modules/eks"

#   project_name = var.project_name

#   environment = var.environment

#   vpc_id = module.networking.vpc_id

#   subnet_ids = module.networking.eks_public_subnet_ids

#   node_security_group_id = module.networking.eks_nodes_security_group_id

#   cluster_version = var.cluster_version

#   node_instance_types = var.node_instance_types

# }

module "argocd" {

  source = "./modules/argocd"

  cluster_name = module.eks.cluster_name

  providers = {
    kubernetes = kubernetes
    helm       = helm
  }

  depends_on = [
    module.eks
  ]

}
