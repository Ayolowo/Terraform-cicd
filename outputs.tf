output "security_group_id" {
  value = aws_security_group.rds_sg.id
}


output "db_instance_endpoint" {
  value = aws_db_instance.myrdsinstance.endpoint
}


output "db_instance_id" {
  value = aws_db_instance.myrdsinstance.id
}


output "vpc_id" {
  value = aws_vpc.rds_vpc.id
}


output "ec2_public_ipv4" {
  value = aws_instance.web.public_ip
}


output "ec2_id" {
  value = aws_instance.web.id
}
