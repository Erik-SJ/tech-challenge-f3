terraform {

  required_providers {

    kubernetes = {
      source = "hashicorp/kubernetes"
    }

    helm = {
      source = "hashicorp/helm"
    }
    
  }
}

variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
}
