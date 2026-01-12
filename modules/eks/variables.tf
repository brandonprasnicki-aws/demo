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

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "instance_types" {
  description = "List of instance types for the node group"
  type        = list(string)
  default     = ["t3.micro"]
}

variable "ami_type" {
  description = "AMI type for the node group"
  type        = string
  default     = "AL2023_x86_64_STANDARD"
}

variable "disk_size" {
  description = "Disk size in GiB for worker nodes"
  type        = number
  default     = 20
}

variable "capacity_type" {
  description = "Capacity type for the node group"
  type        = string
  default     = "ON_DEMAND"
}

variable "ssh_key_name" {
  description = "EC2 SSH key name for remote access"
  type        = string
}

variable "source_security_group_ids" {
  description = "List of security group IDs for remote access"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to apply to the node group"
  type        = map(string)
  default     = {}
}
