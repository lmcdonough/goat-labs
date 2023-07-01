# Define the ArgoCD application
resource "helm_release" "argocd_app" {
  name       = "argocd-app"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "argocd"
  version    = "2.14.0"
}

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
    value = "argocd.example.com"
  }

  set {
    name  = "server.ingress.hosts[0].paths[0]"
    value = "/"
  }

  set {
    name  = "server.ingress.tls[0].hosts[0]"
    value = "argocd.example.com"
  }

  set {
    name  = "server.ingress.tls[0].secretName"
    value = "argocd-tls-secret"
  }

  set {
    name  = "server.extraArgs[0]"
    value = "--insecure"
  }

  set {
    name  = "server.extraArgs[1]"
    value = "--dex-server=http://dex-server:5556"
  }

  set {
    name  = "dex.enabled"
    value = "true"
  }

  set {
    name  = "dex.config.issuer"
    value = "https://dex.example.com"
  }

  set {
    name  = "dex.config.connectors[0].type"
    value = "github"
  }

  set {
    name  = "dex.config.connectors[0].id"
    value = "github"
  }

  set {
    name  = "dex.config.connectors[0].name"
    value = "GitHub"
  }

  set {
    name  = "dex.config.connectors[0].config.clientID"
    value = "YOUR_GITHUB_CLIENT_ID"
  }

  set {
    name  = "dex.config.connectors[0].config.clientSecret"
    value = "YOUR_GITHUB_CLIENT_SECRET"
  }

  set {
    name  = "dex.config.connectors[0].config.orgs[0]"
    value = "YOUR_GITHUB_ORG"
  }

  set {
    name  = "dex.config.connectors[0].config.teams[0]"
    value = "YOUR_GITHUB_TEAM"
  }

  set {
    name  = "dex.config.connectors[0].config.emailDomains[0]"
    value = "example.com"
  }

  set {
    name  = "dex.config.connectors[0].config.hostedDomains[0]"
    value = "example.com"
  }

  set {
    name  = "dex.config.connectors[0].config.syncTeams"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.syncGroups"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.syncEmail"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.usernameKey"
    value = "login"
  }

  set {
    name  = "dex.config.connectors[0].config.emailKey"
    value = "email"
  }

  set {
    name  = "dex.config.connectors[0].config.nameKey"
    value = "name"
  }

  set {
    name  = "dex.config.connectors[0].config.groupsKey"
    value = "groups"
  }

  set {
    name  = "dex.config.connectors[0].config.teamIDsKey"
    value = "team_ids"
  }

  set {
    name  = "dex.config.connectors[0].config.teamNamesKey"
    value = "team_names"
  }

  set {
    name  = "dex.config.connectors[0].config.emailVerifiedKey"
    value = "email_verified"
  }

  set {
    name  = "dex.config.connectors[0].config.avatarURLKey"
    value = "avatar_url"
  }

  set {
    name  = "dex.config.connectors[0].config.groupsPrefix"
    value = "argocd-"
  }

  set {
    name  = "dex.config.connectors[0].config.groupsClaim"
    value = "groups"
  }

  set {
    name  = "dex.config.connectors[0].config.teamIDsClaim"
    value = "team_ids"
  }

  set {
    name  = "dex.config.connectors[0].config.teamNamesClaim"
    value = "team_names"
  }

  set {
    name  = "dex.config.connectors[0].config.emailVerifiedClaim"
    value = "email_verified"
  }

  set {
    name  = "dex.config.connectors[0].config.avatarURLClaim"
    value = "avatar_url"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipEmailVerified"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipUsername"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipEmail"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipGroups"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipTeams"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipEmailVerifiedClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipAvatarURL"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipGroupsClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipTeamIDsClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipTeamNamesClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipEmailVerifiedClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipAvatarURLClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipGroupsPrefix"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipGroupsClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipTeamIDsClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipTeamNamesClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipEmailVerifiedClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipAvatarURLClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipGroupsPrefix"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipGroupsClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipTeamIDsClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipTeamNamesClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipEmailVerifiedClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipAvatarURLClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipGroupsPrefix"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipGroupsClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipTeamIDsClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipTeamNamesClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipEmailVerifiedClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipAvatarURLClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipGroupsPrefix"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipGroupsClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipTeamIDsClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipTeamNamesClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipEmailVerifiedClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipAvatarURLClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipGroupsPrefix"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipGroupsClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipTeamIDsClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipTeamNamesClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipEmailVerifiedClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipAvatarURLClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipGroupsPrefix"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipGroupsClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipTeamIDsClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipTeamNamesClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipEmailVerifiedClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipAvatarURLClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipGroupsPrefix"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipGroupsClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipTeamIDsClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipTeamNamesClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipEmailVerifiedClaim"
    value = "true"
  }

  set {
    name  = "dex.config.connectors[0].config.insecureSkipAvatarURLClaim"
    value = "true"
  }