resource "kubernetes_namespace" "tf-k8s-ns" {
  metadata {
    name = "${var.prefix}-ns"
  }
}

resource "helm_release" "otus-app" {
  name      = var.project_name
  chart     = "${abspath(path.root)}${var.dir}"
  namespace = kubernetes_namespace.tf-k8s-ns.id
}
