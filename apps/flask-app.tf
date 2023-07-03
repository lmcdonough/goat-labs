# Define the Flask application deployment
resource "helm_release" "flask_app" {
  name       = "flask-app"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "flask"
  version    = "1.0.0"

  set {
    name  = "image.repository"
    value = "your-docker-repo/flask-app"
  }

  set {
    name  = "image.tag"
    value = "latest"
  }

  set {
    name  = "service.type"
    value = "ClusterIP"
  }

  set {
    name  = "ingress.enabled"
    value = "false"
  }

  set {
    name  = "resources.limits.cpu"
    value = "500m"
  }

  set {
    name  = "resources.limits.memory"
    value = "512Mi"
  }

  set {
    name  = "resources.requests.cpu"
    value = "200m"
  }

  set {
    name  = "resources.requests.memory"
    value = "256Mi"
  }
}
