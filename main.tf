module "vpc" {
  source = "./vpc"
  vpc_cidr = var.vpc_cidr
}

module "security" {
  source = "./security"
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
}

module "ec2" {
  source = "./ec2"
  vpc_id = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_ids[0]
  private_subnet_id = module.vpc.private_subnet_ids[0]
  bastion_sg_id = module.security.bastion_sg_id
  app_sg_id = module.security.app_sg_id
  key_name = var.key_name
  ami_id = var.ami_id
}
