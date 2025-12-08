# Image Category Definitions
# ==========================
# This file defines logical groupings of container images.
# Categories are used for:
#   - Building subsets of images (nix build .#database-images)
#   - Selecting images in images-to-build.nix (@database)
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
    # Security
    "vault"
    "kyverno"
    "dex"
    "oauth2-proxy"
    "external-secrets"
    "cert-manager"
    "kube-rbac-proxy"
    # GitOps
    "argocd"
    # Operators
    "keda"
    "velero"
    "dragonfly-operator"
    "external-dns"
    # Storage
    "minio"
    "minio-client"
    "memcached"
    # Other
    "zookeeper"
    "openldap"
    "bats"
    "shellcheck"
    "geoipupdate"
  ];
}
