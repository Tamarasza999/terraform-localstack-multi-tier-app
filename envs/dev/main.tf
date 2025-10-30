terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
  backend "local" { path = "terraform.tfstate" }
}

provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  # Force path-style S3 URLs for LocalStack
  s3_use_path_style           = true
  
  endpoints {
    ec2 = "http://localhost:4566"
    iam = "http://localhost:4566"
    s3  = "http://localhost:4566"
  }
}

module "networking" {
  source = "../../modules/networking"
  env             = var.env
  cidr_block      = var.cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}

module "compute" {
  source = "../../modules/compute"
  env                = var.env
  subnet_ids         = module.networking.private_subnet_ids
  security_group_ids = [module.networking.web_security_group_id]
  instance_type      = var.instance_type
}

module "storage" {
  source = "../../modules/storage"
  env    = var.env
}
