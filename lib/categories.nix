# Image Category Definitions
# ==========================
# This file defines logical groupings of container images.
# Categories are used for:
#   - Building subsets of images (nix build .#database-images)
#   - Building image bundles via category attrs (@database)
#   - Organizing the image catalog

{
  # Infrastructure images - Kubernetes operators and controllers
  infrastructure = [
    "dragonfly-operator"
    "external-dns"
  ];

  # Database images - Data stores and database servers
  database = [
    "postgres"
    "mariadb"
    "redis"
    "valkey"
    "mongodb"
  ];

  # Web images - HTTP servers and reverse proxies
  web = [
    "nginx"
    "caddy"
    "haproxy"
    "hugo"
  ];

  # Runtime images - Programming language environments
  runtime = [
    "python"
    "python-fips"
    "node"
    "go"
    "rust"
    "jdk"
    "jre"
    "dotnet"
    "aspnet-runtime"
    "ruby"
    "php"
  ];

  # CLI images - Command-line tools
  cli = [
    "kubectl"
    "helm"
    "kubernetes-helm"
    "cosign"
    "grype"
    "crane"
    "curl"
    "git"
    "sops"
    "bash"
    "busybox"
  ];

  # DevOps images - Container and deployment tools
  devops = [
    "docker-compose"
    "dive"
    "ko"
    "wait-for-it"
  ];

  # Nix images - Nix ecosystem tools
  nix = [
    "nix"
    "nix-flakes"
    "nix-unstable"
    "cachix"
    "cachix-flakes"
    "devenv"
    "attic"
  ];

  # Build images - Build environments and compilers
  build = [
    "cpp-build-env"
    "cpp-runtime"
    "rust-build-env"
    "gradle"
    "maven"
    "glibc-dynamic"
    "static"
  ];

  # Dev images - Development tools and environments
  dev = [
    "devcontainer"
    "pocket-id"
    "maddy"
  ];

  # Chart images - Images for Helm chart deployments
  chart = [
    # Observability
    "prometheus"
    "alertmanager"
    "grafana"
    "loki"
    "tempo"
    "thanos"
    "alloy"
    "node-exporter"
    "kube-state-metrics"
    "prometheus-operator"
    "prometheus-adapter"
    # Security - Vault
    "vault"
    "vault-k8s"
    "vault-csi-provider"
    # Security - Kyverno
    "kyverno"
    "kyverno-cli"
    "kyvernopre"
    "kyverno-background-controller"
    "kyverno-cleanup-controller"
    "kyverno-reports-controller"
    # Security - Other
    "dex"
    "oauth2-proxy"
    "external-secrets"
    "kube-rbac-proxy"
    # Security - cert-manager
    "cert-manager-controller"
    "cert-manager-webhook"
    "cert-manager-cainjector"
    "cert-manager-startupapicheck"
    # GitOps
    "argocd"
    "argocd-extension-installer"
    # Operators - KEDA
    "keda"
    "keda-metrics-apiserver"
    "keda-admission-webhooks"
    # Operators - Other
    "velero"
    "dragonfly-operator"
    "external-dns"
    # Storage
    "minio"
    "minio-client"
    "memcached"
    "seaweedfs"
    # Git
    "gitea"
    # PostgreSQL
    "pgpool"
    "postgres-exporter"
    "cloudnative-pg"
    # Flux CD
    "flux-cli"
    "flux-operator"
    "source-controller"
    "kustomize-controller"
    "helm-controller"
    "notification-controller"
    "image-automation-controller"
    "image-reflector-controller"
    # Other
    "zookeeper"
    "openldap"
    "bats"
    "shellcheck"
    "geoipupdate"
    # Additional observability
    "blackbox-exporter"
    "memcached-exporter"
    "redis-exporter"
    "metrics-server"
    "mimir"
    "grafana-image-renderer"
    "rollout-operator"
    "prometheus-config-reloader"
    # Networking
    "fluent-bit"
    "traefik"
    "node-local-dns"
    # Security
    "gatekeeper"
    "trust-manager"
    # Utilities
    "yq"
    "configmap-reload"
    "k8s-sidecar"
    # Operators and controllers
    "crossplane"
    "gitlab-runner"
    "snapshot-controller"
    "spegel"
    "reloader"
    "reflector"
    "ingress-nginx"
  ];
}
