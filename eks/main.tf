resource "aws_eks_cluster" "example" {
  name     = var.cluster_name
  role_arn = var.role_arn
  vpc_config {
    subnet_ids = var.subnet_ids
  }
}
