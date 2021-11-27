variable "region" {
  type        = string
  description = "Please provide a region for instances"
  default     = "us-east-1"
}

variable "vpc_id" {
  type        = string
  description = "Please provide a VPC ID"
  default     = "vpc-0bf4e96462538b07a"
}

variable "subnet_ids" {
  description = "Please provide Subnet ID's"
  type        = list(any)
  default     = ["subnet-0b0d86492e1914070", "subnet-09729e860136c70c6"]
}

variable "allocated_storage" {
  type        = number
  description = "Please provide min storage capacity"
  default     = "50"
}
variable "max_allocated_storage" {
  type        = number
  description = "Please provide max storage capacity"
  default     = "500"
}
variable "engine" {
  type        = string
  description = "Please provide DB Engine type"
  default     = "mysql"
}

variable "engine_version" {
  type        = number
  description = "Please provide DB Engine type"
  default     = "5.7"
}

variable "instance_class" {
  type        = string
  description = "Please provide instance class"
  default     = "db.t2.micro"
}
variable "name" {
  type        = string
  description = "Please provide DB name"
  default     = "mydb"

}
variable "username" {
  type        = string
  description = "Please provide DB username"
  default     = "admin"
}
variable "publicly_accessible" {
  type        = bool
  description = "Pubclicly accessible?"
  default     = true
}


