output "public_ip" {
  value = aws_instance.test.public_ip
}
output "private_ip" {
  value = aws_instance.test.private_ip
}
output "az" {
  value = aws_instance.test.availability_zone
}