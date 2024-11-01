resource "mgc_network_public_ips" "ip" {
    vpc_id = mgc_network_vpc.vpc.id
    description = "public ip for atesete (at7) vpc"
}