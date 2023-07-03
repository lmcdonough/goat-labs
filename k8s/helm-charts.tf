# Define the Helm charts
resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "3.11.3"

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "server.ingress.enabled"
    value = "true"
  }

  set {
    name  = "server.ingress.annotations.kubernetes.io/ingress.class"
    value = "nginx"
  }

  set {
    name  = "server.ingress.annotations.nginx.ingress.kubernetes.io/ssl-redirect"
    value = "false"
  }

  set {
    name  = "server.ingress.hosts[0].host"
    value = "argocd.<HOSTNAME>.com"
  }

  set {
    name  = "server.ingress.hosts[0].paths[0]"
    value = "/"
  }

  set {
    name  = "server.ingress.tls[0].hosts[0]"
    value = "argocd.<HOSTNAME>.com"
  }

  set {
    name  = "server.ingress.tls[0].secretName"
    value = "argocd-tls"
  }

  set {
    name  = "server.config.system.secretName"
    value = "<ARGOCD-SECRET>"
  }

  set {
    name  = "server.config.system.username"
    value = "<ADMIN>"
  }

  set {
    name  = "server.config.system.password"
    value = "<ADMIN>"
  }

  set {
    name  = "server.config.repo.url"
    value = "https://github.com/lmcdonough/goat"
  }

  set {
    name  = "server.config.repo.username"
    value = "lmcdonough"
  }

  set {
    name  = "server.config.repo.password"
    value = "<SERVER PASSWORD>"
  }

  set {
    name  = "server.config.repo.insecure"
    value = "true"
  }

  set {
    name  = "server.config.repo.type"
    value = "git"
  }

  set {
    name  = "server.config.repo.name"
    value = "https://github.com/lmcdonough/goat"
  }

  set {
    name  = "server.config.repo.path"
    value = "https://github.com/lmcdonough/goat"
  }

  set {
    name  = "server.config.repo.branch"
    value = "main"
  }

  set {
    name  = "server.config.repo.helm.valueFiles[0]"
    value = "values.yaml"
  }

  set {
    name  = "server.config.repo.helm.path"
    value = "https://github.com/lmcdonough/goat"
  }

  set {
    name  = "server.config.repo.helm.releaseName"
    value = "<RELEASE VERSION>"
  }

  set {
    name  = "server.config.repo.helm.targetNamespace"
    value = "APP NAMESPACE"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.auto"
    value = "true"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.prune"
    value = "true"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.selfHeal"
    value = "true"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.allowEmpty"
    value = "true"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.retry"
    value = "true"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.retryInterval"
    value = "10s"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.retryTimeout"
    value = "5m"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.maxConcurrent"
    value = "1"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.pruneTimeout"
    value = "5m"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.selfHealTimeout"
    value = "5m"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPrune"
    value = "true"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneTimeout"
    value = "5m"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneInterval"
    value = "10s"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDelete"
    value = "true"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteTimeout"
    value = "5m"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteInterval"
    value = "10s"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteMaxConcurrent"
    value = "1"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteTimeout"
    value = "5m"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteInterval"
    value = "10s"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteMaxConcurrent"
    value = "1"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteTimeout"
    value = "5m"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteInterval"
    value = "10s"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteMaxConcurrent"
    value = "1"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteTimeout"
    value = "5m"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteInterval"
    value = "10s"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteMaxConcurrent"
    value = "1"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteTimeout"
    value = "5m"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteInterval"
    value = "10s"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteMaxConcurrent"
    value = "1"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteTimeout"
    value = "5m"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteInterval"
    value = "10s"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteMaxConcurrent"
    value = "1"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteTimeout"
    value = "5m"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteInterval"
    value = "10s"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteMaxConcurrent"
    value = "1"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteTimeout"
    value = "5m"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteInterval"
    value = "10s"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteMaxConcurrent"
    value = "1"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteTimeout"
    value = "5m"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteInterval"
    value = "10s"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteMaxConcurrent"
    value = "1"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteTimeout"
    value = "5m"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteInterval"
    value = "10s"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteMaxConcurrent"
    value = "1"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteTimeout"
    value = "5m"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteInterval"
    value = "10s"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteMaxConcurrent"
    value = "1"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteTimeout"
    value = "5m"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteInterval"
    value = "10s"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteMaxConcurrent"
    value = "1"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteTimeout"
    value = "5m"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteInterval"
    value = "10s"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteMaxConcurrent"
    value = "1"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteTimeout"
    value = "5m"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteInterval"
    value = "10s"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteMaxConcurrent"
    value = "1"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteTimeout"
    value = "5m"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteInterval"
    value = "10s"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteMaxConcurrent"
    value = "1"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteTimeout"
    value = "5m"
  }

  set {
    name  = "server.config.repo.helm.syncPolicy.autoPruneOnDeleteInterval"
    value = "10s"
  }
}