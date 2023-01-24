
variable "region" {
  description = "AWS Region"
  default     = "ap-southeast-2"
  type        = string

}

variable "environment" {
  description = "AWS environment name"
  type        = string

}

variable "app_name" {
  description = "Applicaiton Name"
  type        = string

}

#------------------------------------------------------------------------------
# VPC
#------------------------------------------------------------------------------

variable "vpc_cidr_range" {
  type = string

}

variable "private_subnets_list" {
  description = "Subnet for infrastructure"
  type        = list(string)

}

#------------------------------------------------------------------------------
# Other
#------------------------------------------------------------------------------

variable "ManagedByLocation" {
  description = "IaC location"
  default     = "https://github.com/"
}






