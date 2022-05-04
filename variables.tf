variable "region_number" {
  # Arbitrary mapping of region name to number to use in
  # a VPC's CIDR prefix.
  default = {
    us-east-1      = 1
    us-west-1      = 2
    us-west-2      = 3
    eu-central-1   = 4
    ap-northeast-1 = 5
  }
}

variable "server_port" {
    description = "Port from EC2"
    type = number
    default = 80
}

output "server_port" {
    description = "Connect to the EC2 at this port"
    value = var.server_port
}
