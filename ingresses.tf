resource "kubernetes_ingress_v1" "alb_ingress" {
  wait_for_load_balancer = true
  metadata {
    name      = "alb-ingress-connect-nginx"
    namespace = "kube-system"

    annotations = {
      "alb.ingress.kubernetes.io/certificate-arn"  = "${var.certificate_arn}"
      "alb.ingress.kubernetes.io/listen-ports" = "[{\"HTTP\": 80}, {\"HTTPS\": 443}]"
      "alb.ingress.kubernetes.io/ssl-redirect" = "443"
      "alb.ingress.kubernetes.io/healthcheck-path" = "/healthz"
      "alb.ingress.kubernetes.io/scheme"           = "internet-facing"
      "alb.ingress.kubernetes.io/target-type"      = "ip"
      "kubernetes.io/ingress.class"                = "alb"
      "alb.ingress.kubernetes.io/load-balancer-name" = "${var.lb_project_name}"
    }
  }

  spec {
    rule {
      http {
        path {
          backend {
            service {
              name = "nginx-ingress-controller"
              port {
                number = 80
              }
            }
          }
          path      = "/"
          path_type = "Prefix"
        }
      }
    }
  }

  depends_on = [
    helm_release.nginx_ingress_controller
  ]
}

output "alb_ingress_dns" {
    value = kubernetes_ingress_v1.alb_ingress.status.0.load_balancer.0.ingress.0.hostname
}
