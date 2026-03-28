output "instance_id" {
  value = aws_instance.demo_instance.id
}

output "alb_dns" {
  value = aws_lb.demo_alb.dns_name
}
