resource "kubernetes_namespace" "argocd" {

  metadata {
    name = "argocd"
  }

}

resource "helm_release" "argocd" {

  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = kubernetes_namespace.argocd.metadata[0].name

  create_namespace = false
  
  values = [
    file("${path.module}/values.yaml")
  ]

  wait    = true
  timeout = 600
  atomic  = true

  depends_on = [
    kubernetes_namespace.argocd
  ]

}
