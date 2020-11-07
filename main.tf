terraform {
  required_providers {
    alicloud = {
      version = ">= 1.103"
      source  = "hashicorp/alicloud"
    }
  }
}

provider "alicloud" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

module "vpc" {
  source        = "./modules/vpc"
}
