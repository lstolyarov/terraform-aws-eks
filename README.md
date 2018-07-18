# EKS AWS Module

This repo contains a Module for how to deploy an [EKS](https://aws.amazon.com/eks/) cluster on 
[AWS](https://aws.amazon.com/) using [Terraform](https://www.terraform.io/). 

## How to use this Module

```
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "1.37.0"

  name = "kube-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1d"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

module "eks" {
  source = "terraform-aws-eks"

  cluster_name        = "kubels"
  vpc_id              = "${module.vpc.vpc_id}"
  ingress_cidr_blocks = ["0.0.0.0/0"]
  subnet_ids          = "${module.vpc.private_subnets}"
  key                 = ""
}
```
