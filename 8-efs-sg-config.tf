module "efs_services_sg" {
    source = "terraform-aws-modules/security-group/aws"
    version = "4.17.1"
    
    name        = "efs-services-sg"
    description = "Allow access to efs services"
    vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
    
    ingress_cidr_blocks = ["0.0.0.0/0"]
    ingress_rules       = ["nfs-2049-tcp", "nfs-2049-udp"]

    egress_rules = ["all-all"]
    
}