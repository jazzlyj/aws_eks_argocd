# Automated Standard EKS deployment
This repository contains Terraform scripts and Kubernetes resources to automate the deployment of a standard EKS cluster along with related resources and applications. It simplifies the provisioning and management of the EKS cluster, providing a quick way to get started with Kubernetes on AWS.
## Overview
The deployment set up the following resources:

* **VPC:** A Virtual Private Cloud for isolating your cluster.
* **EKS Cluster:** Managed Kubernetes service that makes it easier to deploy, manage, and scale containerized applications.
* **EKS Node Group:** A group of worker nodes that register with the Kubernetes control plane.
* **ArgoCD:** Continuous Delivery tool for Kubernetes.
* **AWS-LB Ingress Controller:** Manages AWS Load Balancers for ingress traffic.
* **External-DNS:** Automatically manages external DNS records based on ingress and service resources.

## Prerequisites
* AWS Account with necessary permissions
* Terraform v1.8+ installed
* kubectl v1.29+ installed
* AWS CLI configured with access credentials

## Deploy Infrastructure
Update needed versions, AWS acctid and domain name in the tf files

```bash
cd terraform

terraform init
terraform plan -out plan.out
terraform apply plan.out
```
**Note:** You may have to apply twice

### Sequence notes
* Make sure there is a valid public domain hosted in AWS R53
* Deploy vpc first (vpc, variables, versions) 
* Add eks.tf and iam.tf into tf dir (being deployed from) then tfi, and then tfa
* Add argocd.tf into tf dir and then tfa

## Deploy K8s resources

Update declarations in the following files with your account information:

* `alb-controller.yaml`

* `cluster-autoscaler.yaml`

* `external-dns.yaml`

* `ingress-argo.yaml`

```bash
cd ../k8s

cat *.yaml | kubectl apply -f -
```
**Note:** It may take around 5-10 minutes before all k8s deployments and resources are deployed.
