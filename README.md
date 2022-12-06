# terraform-nginx-controller
Install ingress nginx controller on Kubernetes Cluster / EKS Cluster (AWS)

How to use it
```
module "nginx-ingress" {
  source                 = "git@github.com:taulanthalili/terraform-nginx-controller.git?ref=main"
  namespace              = module.data.namespace
  environment            = module.data.environment
}
```