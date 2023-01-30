# terraform-nginx-controller
Install ingress nginx controller on Kubernetes Cluster / EKS Cluster (AWS)

ALB-Controller should be already installed in order to configure the alb-ingress:

https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/
```
alb.ingress.kubernetes.io/load-balancer-name: lbname
alb.ingress.kubernetes.io/certificate-arn: arn:aws:acm:xxxx
alb.ingress.kubernetes.io/healthcheck-path: /healthz
alb.ingress.kubernetes.io/listen-ports: '[{"HTTP": 80}, {"HTTPS": 443}]'
alb.ingress.kubernetes.io/scheme: internet-facing
alb.ingress.kubernetes.io/ssl-redirect: "443"
alb.ingress.kubernetes.io/target-type: ip
kubernetes.io/ingress.class: alb
```
How to use it
```
module "nginx-ingress" {
  source                 = "git::https://github.com/taulanthalili/terraform-nginx-controller.git?ref=main"
  namespace              = module.data.namespace
  environment            = module.data.environment
}
```
