resource "helm_release" "nginx_ingress_controller" {
  name       = "nginx-ingress-controller"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx-ingress-controller"
  version    = "9.3.12"
  namespace = "kube-system"

  set {
    name  = "ingressClassResource.default"
    value = "true"
    type  = "string"
  }

  set {
    name  = "config.use-forwarded-headers"
    value = "true"
    type  = "string"
  }

  set {
    name  = "service.type"
    value = "NodePort"
    type  = "string"
  }

  set {
    name  = "service.nodePorts.http"
    value = "30415"
    type  = "string"
  }

  set {
    name  = "service.nodePorts.https"
    value = "31429"
    type  = "string"
  }
}
