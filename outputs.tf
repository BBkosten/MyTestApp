output "web_loadbalanser_url" {
  value = aws_elb.Balanser_for_WebApp.dns_name
  description = "Доменное имя ALB"
}