variable "argocd_chart_version" {
  description = "ArgoCD Helm Chart Version"
  type        = string

  default = "6.7.18"
}

variable "argocd_helm_settings" {
  description = "Additional settings for ArgoCD Helm deployment"
  type        = any

  default = {
    server = {
      extraArgs = ["--insecure"]
    }
  }
}

variable "eks_cluster_version" {
  description = "Kubernetes version for EKS cluster"
  type        = string

  default = "1.29"
}

variable "environment" {
  description = "Environment name for project"
  type        = string

  default = "eks_argocd"
}

variable "public_domain" {
  description = "Public DNS zone name"
  type        = string

  default = "$DOMAINNAME"
}

variable "region" {
  description = "AWS Region where resources will be deployed"
  type        = string

  default = "us-east-1"
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)

  default = {}
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC where resources will be deployed"
  type        = string

  default = "10.230.0.0/16"
}
