resource "aws_vpc_dhcp_options" "this" {
  domain_name_servers   = var.dns_ip_addresses
  domain_name = var.domain_name
}

resource "aws_vpc_dhcp_options_association" "dns_resolver" {
  vpc_id          = var.vpc_id
  dhcp_options_id = aws_vpc_dhcp_options.this.id
}