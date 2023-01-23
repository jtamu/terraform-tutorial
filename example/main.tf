module "web_server" {
	source = "./http_server"
	example_instance_type = "t3.micro"
}

output "example_instance_id" {
	value = module.web_server.id
}

output "example_public_dns" {
	value = module.web_server.public_dns
}
