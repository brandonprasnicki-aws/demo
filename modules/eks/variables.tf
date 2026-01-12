variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "k8s_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.28"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "access_config" {
  description = "Access configuration for the EKS cluster"
  type = object({
    authentication_mode = string
  })
  default = {
    authentication_mode = "API"
  }
}

variable "kubernetes_groups" {
  description = "List of Kubernetes groups for the access entry"
  type        = list(string)
  default     = ["group-1", "group-2"]
}

variable "access_entry_type" {
  description = "Type of the access entry"
  type        = string
  default     = "STANDARD"
}
variable "access_entry_principal_arn" {
  type = string
}
