module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "demo-cluster"
  cluster_version = "1.34"

  # VPC
  vpc_id     = "vpc-02367162570faa9e2"
  subnet_ids = ["subnet-0aaaa2255f0348a0f", "subnet-00dfd98d933e7c75a"]

  # Managed node group 
  eks_managed_node_groups = {
    default = {
      desired_size = 2
      min_size     = 1
      max_size     = 3

      instance_types = ["t3.medium"]
      capacity_type = "ON_DEMAND"
    }
  }
}