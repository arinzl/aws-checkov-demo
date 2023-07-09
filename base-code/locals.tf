locals {
  region = "ap-southeast-2"

  tags_generic = {
    appname     = var.app_name
    environment = var.environment
    costcentre  = "TBC"
    ManagedBy   = var.ManagedByLocation
  }

  tags_ssm_ssm = {
    Name = "myvpc-vpce-interface-ssm-ssm"
  }

  tags_ssm_ssmmessages = {
    Name = "myvpc-vpce-interface-ssm-ssmmessages"
  }

  tags_ssm_ec2messages = {
    Name = "myvpc-vpce-interface-ssm-ec2messages"
  }

}
