output "vpc_id" {
  value = var.vpc_id
}

#output "data_subnets_ids" {
#  value = aws_subnet.data_subnets.*.id
#}

output "pri_subnets_az1_ids" {
  value = aws_subnet.pri_subnets_az1.*.id
}
output "pri_subnets_az2_ids" {
  value = aws_subnet.pri_subnets_az2.*.id
}
output "pri_subnets_az3_ids" {
  value = aws_subnet.pri_subnets_az3.*.id
}
output "pub_subnets_ids" {
  value = aws_subnet.pub_subnets.*.id
}

/*
output "private_route_table_id" {
  value = aws_route_table.private_route_table.*.id
}

output "private_route_tables_az2_ids" {
  value = aws_route_table.private_route_table_az2.*.id
}
output "private_route_tables_az3_ids" {
  value = aws_route_table.private_route_table_az3.*.id
}

output "public_route_table_id" {
  value = aws_route_table.public_route_table.*.id
}
*/
/*
output "external_network_acl_id" {
  value = aws_network_acl.external.id
}

output "internal_network_acl_id" {
  value = aws_network_acl.external.id
}
*/