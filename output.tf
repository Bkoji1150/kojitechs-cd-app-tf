
output "alb_endpoint" {
    value = "http://${kubernetes_service_v1.lb_service_nlb.status.0.load_balancer.0.ingress.0.hostname}"
}
