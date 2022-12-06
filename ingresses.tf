resource "kubernetes_ingress" "alb_ingress" {
  metadata {
    name = "alb-ingress-connect-nginx"
    namespace = "kube-system"

    annotations {
      #"alb.ingress.kubernetes.io/certificate-arn" = "<CERTIFICATE_ARN>"
      "alb.ingress.kubernetes.io/healthcheck-path" = "/healthz"
      "alb.ingress.kubernetes.io/scheme" = "internet-facing"
      "alb.ingress.kubernetes.io/target-type" = "ip"
      "kubernetes.io/ingress.class" = "alb"
    }
  }

  spec {
    rule {
      http {
        path {
          backend {
            service_name = "nginx-ingress-controller"
            service_port = 80
          }
          path = "/"
        }
      }
    }
  }
}