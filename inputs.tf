variable "cluster_name" {
  type = "string"
}

variable "vpc_id" {
  type = "string"
}

variable "ingress_cidr_blocks" {
  type = "list"
}

variable "subnet_ids" {
  type = "list"
}

variable "key" {
  type = "string"
}
