module "vpc" {
    source  = "terraform-google-modules/network/google//modules/vpc"
    version = "~>4.0"
    project_id   = var.project_id
    network_name = var.network_name
    routing_mode = "GLOBAL"
    
}
module "subnets" {
    source  = "terraform-google-modules/network/google//modules/subnets"
    version =  "3.63.0"
    project_id   = var.project_id
    network_name = module.vpc.network_name
    subnets = [
        {
            subnet_name           = "subnet1"
            subnet_ip             = "10.1.0.0/26"
            subnet_region         = "us-central1"
            subnet_private_access = "true"
            subnet_flow_logs      = "false"
        },

        {
            subnet_name           = "subnet2"
            subnet_ip             = "10.2.0.0/26"
            subnet_region         = "us-central1"
            subnet_private_access = "true"
            subnet_flow_logs      = "false"
        },
        {
            subnet_name           = "subnet3"
            subnet_ip             = "10.3.0.0/26"
            subnet_region         = "us-central1"
            subnet_private_access = "true"
            subnet_flow_logs      = "false"
        }
     ]
    }
