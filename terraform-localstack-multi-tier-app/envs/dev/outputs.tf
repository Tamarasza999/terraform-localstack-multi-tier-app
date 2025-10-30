output "vpc_id" { value = module.networking.vpc_id }
output "web_instance_id" { value = module.compute.web_instance_id }
output "app_instance_id" { value = module.compute.app_instance_id }
output "app_bucket_id" { value = module.storage.app_bucket_id }
