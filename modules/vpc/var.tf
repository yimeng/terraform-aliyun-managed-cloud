# variable "vpc_id" {
#   default = "123456"
# }

variable "vpc_cidr" {
  default = "172.20.0.0/16"
}

# variable "vswitch_ids" {
#   default = "123456"
# }

variable "vswitch_cidrs" {
  default = "172.20.1.0/24"
}

variable "availability_zone" {
  default = "cn-beijing-c"
}
