resource "alicloud_vpc" "vpc" {
  name       = "vpc_test"
  cidr_block = var.vpc_cidr
}

output "alicloud_vpc" {
  value = alicloud_vpc.vpc
}

// According to the vswitch cidr blocks to launch several vswitches
resource "alicloud_vswitch" "vswitches" {
  vpc_id            = alicloud_vpc.vpc.id
  cidr_block        = var.vswitch_cidrs
  availability_zone = var.availability_zone
}

# resource "alicloud_cs_kubernetes" "k8s" {
#   count                 = 1
#   master_vswitch_ids    = length(var.vswitch_ids) > 0 ? split(",", join(",", var.vswitch_ids)): length(var.vswitch_cidrs) < 1 ? [] : split(",", join(",", alicloud_vswitch.vswitches.*.id))
#   worker_vswitch_ids    = length(var.vswitch_ids) > 0 ? split(",", join(",", var.vswitch_ids)): length(var.vswitch_cidrs) < 1 ? [] : split(",", join(",", alicloud_vswitch.vswitches.*.id))
#   master_instance_types = var.master_instance_types
#   worker_instance_types = var.worker_instance_types
#   worker_number         = var.worker_number
#   node_cidr_mask        = var.node_cidr_mask
#   enable_ssh            = var.enable_ssh
#   install_cloud_monitor = var.install_cloud_monitor
#   cpu_policy            = var.cpu_policy
#   proxy_mode            = var.proxy_mode
#   password              = var.password
#   pod_cidr              = var.pod_cidr
#   service_cidr          = var.service_cidr
#   # version can not be defined in variables.tf. Options: 1.16.6-aliyun.1|1.14.8-aliyun.1
#   version               = "1.16.6-aliyun.1"
#   dynamic "addons" {
#       for_each = var.cluster_addons
#       content {
#         name                    = lookup(addons.value, "name", var.cluster_addons)
#         config                  = lookup(addons.value, "config", var.cluster_addons)
#         disabled                = lookup(addons.value, "disabled", var.cluster_addons)
#       }
#   }
# }
