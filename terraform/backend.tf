terraform {
  backend "s3" {
    bucket = "bsc.sandbox.terraform.state"
    key    = "eks_argocd"
    region = "us-east-2"
  }
}