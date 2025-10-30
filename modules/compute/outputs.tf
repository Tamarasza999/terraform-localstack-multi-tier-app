output "web_instance_id" { value = aws_instance.web.id }
output "app_instance_id" { value = aws_instance.app.id }
output "web_private_ip" { value = aws_instance.web.private_ip }
output "app_private_ip" { value = aws_instance.app.private_ip }
