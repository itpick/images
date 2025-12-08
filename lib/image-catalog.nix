# Image Catalog
# ==============
# Comprehensive catalog of all container images with their metadata.
# This is the single source of truth for:
#   - Upstream image references
#   - Entrypoint and command arguments
#   - Package source (nixpkgs or build from source)
#   - Chart associations
#   - Categories
#
# Usage:
#   let catalog = import ./lib/image-catalog.nix;
#   in catalog.prometheus.upstream.image
#
# Status values:
#   - "nixpkgs": Built from nixpkgs package
#   - "source": Built from source (buildGoModule, etc.)
#   - "custom": Custom build logic

{
  # ===========================================================================
  # OBSERVABILITY
  # ===========================================================================

  prometheus = {
    status = "nixpkgs";
    package = "prometheus";
    entrypoint = [ "/bin/prometheus" ];
    cmd = [
      "--config.file=/etc/prometheus/prometheus.yml"
      "--storage.tsdb.path=/prometheus"
      "--web.console.libraries=/usr/share/prometheus/console_libraries"
      "--web.console.templates=/usr/share/prometheus/consoles"
    ];
    upstream = {
      image = "quay.io/prometheus/prometheus";
      tag = "v2.54.1";
    };
    category = "observability";
    chart = "kube-prometheus-stack";
    description = "Prometheus monitoring system and time series database";
  };

  alertmanager = {
    status = "nixpkgs";
    package = "prometheus-alertmanager";
    entrypoint = [ "/bin/alertmanager" ];
    cmd = [
      "--config.file=/etc/alertmanager/alertmanager.yml"
      "--storage.path=/alertmanager"
    ];
    upstream = {
      image = "quay.io/prometheus/alertmanager";
      tag = "v0.27.0";
    };
    category = "observability";
    chart = "kube-prometheus-stack";
    description = "Prometheus Alertmanager for handling alerts";
  };

  grafana = {
    status = "nixpkgs";
    package = "grafana";
    entrypoint = [ "/bin/grafana-server" ];
    cmd = [
      "--homepath=/usr/share/grafana"
      "--config=/etc/grafana/grafana.ini"
    ];
    upstream = {
      image = "docker.io/grafana/grafana";
      tag = "11.2.1";
    };
    category = "observability";
    chart = "kube-prometheus-stack";
    description = "Grafana visualization and analytics platform";
  };

  loki = {
    status = "nixpkgs";
    package = "grafana-loki";
    entrypoint = [ "/bin/loki" ];
    cmd = [ "-config.file=/etc/loki/loki.yaml" ];
    upstream = {
      image = "docker.io/grafana/loki";
      tag = "3.0.0";
    };
    category = "observability";
    chart = "loki";
    description = "Grafana Loki log aggregation system";
  };

  tempo = {
    status = "nixpkgs";
    package = "tempo";
    entrypoint = [ "/bin/tempo" ];
    cmd = [ "-config.file=/etc/tempo/tempo.yaml" ];
    upstream = {
      image = "docker.io/grafana/tempo";
      tag = "2.5.0";
    };
    category = "observability";
    chart = "tempo";
    description = "Grafana Tempo distributed tracing backend";
  };

  thanos = {
    status = "nixpkgs";
    package = "thanos";
    entrypoint = [ "/bin/thanos" ];
    cmd = [ "sidecar" ];
    upstream = {
      image = "quay.io/thanos/thanos";
      tag = "v0.36.1";
    };
    category = "observability";
    chart = "kube-prometheus-stack";
    description = "Thanos for highly available Prometheus";
  };

  alloy = {
    status = "nixpkgs";
    package = "grafana-alloy";
    entrypoint = [ "/bin/alloy" ];
    cmd = [ "run" "/etc/alloy/config.alloy" ];
    upstream = {
      image = "docker.io/grafana/alloy";
      tag = "v1.5.1";
    };
    category = "observability";
    chart = "alloy";
    description = "Grafana Alloy OpenTelemetry Collector";
  };

  node-exporter = {
    status = "nixpkgs";
    package = "prometheus-node-exporter";
    entrypoint = [ "/bin/node_exporter" ];
    cmd = [
      "--path.procfs=/host/proc"
      "--path.sysfs=/host/sys"
      "--path.rootfs=/host/root"
    ];
    upstream = {
      image = "quay.io/prometheus/node-exporter";
      tag = "v1.8.2";
    };
    category = "observability";
    chart = "kube-prometheus-stack";
    description = "Prometheus exporter for hardware and OS metrics";
  };

  kube-state-metrics = {
    status = "nixpkgs";
    package = "kube-state-metrics";
    entrypoint = [ "/bin/kube-state-metrics" ];
    cmd = [ "--port=8080" "--telemetry-port=8081" ];
    upstream = {
      image = "registry.k8s.io/kube-state-metrics/kube-state-metrics";
      tag = "v2.13.0";
    };
    category = "observability";
    chart = "kube-prometheus-stack";
    description = "Kubernetes state metrics exporter";
  };

  prometheus-operator = {
    status = "source";
    source = "https://github.com/prometheus-operator/prometheus-operator";
    version = "0.77.1";
    entrypoint = [ "/bin/operator" ];
    cmd = [ "--log-level=info" ];
    upstream = {
      image = "quay.io/prometheus-operator/prometheus-operator";
      tag = "v0.77.1";
    };
    category = "observability";
    chart = "kube-prometheus-stack";
    description = "Prometheus Operator for Kubernetes";
  };

  prometheus-adapter = {
    status = "source";
    source = "https://github.com/kubernetes-sigs/prometheus-adapter";
    version = "0.12.0";
    entrypoint = [ "/bin/adapter" ];
    cmd = [ "--config=/etc/adapter/config.yaml" ];
    upstream = {
      image = "registry.k8s.io/prometheus-adapter/prometheus-adapter";
      tag = "v0.12.0";
    };
    category = "observability";
    chart = "prometheus-adapter";
    description = "Prometheus metrics adapter for Kubernetes";
  };

  # ===========================================================================
  # SECURITY - VAULT
  # ===========================================================================

  vault = {
    status = "nixpkgs";
    package = "vault";
    entrypoint = [ "/bin/vault" ];
    cmd = [ "server" "-dev" ];
    upstream = {
      image = "hashicorp/vault";
      tag = "1.16.1";
    };
    category = "security";
    chart = "vault";
    description = "HashiCorp Vault secrets management";
  };

  vault-k8s = {
    status = "source";
    source = "https://github.com/hashicorp/vault-k8s";
    version = "1.4.1";
    entrypoint = [ "/bin/vault-k8s" ];
    cmd = [ "agent-inject" ];
    upstream = {
      image = "hashicorp/vault-k8s";
      tag = "1.4.1";
    };
    category = "security";
    chart = "vault";
    description = "Vault Agent Injector for Kubernetes";
  };

  vault-csi-provider = {
    status = "source";
    source = "https://github.com/hashicorp/vault-csi-provider";
    version = "1.4.2";
    entrypoint = [ "/bin/vault-csi-provider" ];
    cmd = [];
    upstream = {
      image = "hashicorp/vault-csi-provider";
      tag = "1.4.2";
    };
    category = "security";
    chart = "vault";
    description = "Vault CSI Provider for Kubernetes";
  };

  # ===========================================================================
  # SECURITY - KYVERNO
  # ===========================================================================

  kyverno = {
    status = "nixpkgs";
    package = "kyverno";
    entrypoint = [ "/bin/kyverno" ];
    cmd = [];
    upstream = {
      image = "ghcr.io/kyverno/kyverno";
      tag = "v1.13.0";
    };
    category = "security";
    chart = "kyverno";
    description = "Kyverno policy engine for Kubernetes";
  };

  kyverno-cli = {
    status = "nixpkgs";
    package = "kyverno";
    binary = "kyverno";
    entrypoint = [ "/bin/kyverno" ];
    cmd = [ "--help" ];
    upstream = {
      image = "ghcr.io/kyverno/kyverno-cli";
      tag = "v1.13.0";
    };
    category = "security";
    chart = "kyverno";
    description = "Kyverno CLI tool";
  };

  kyvernopre = {
    status = "source";
    source = "https://github.com/kyverno/kyverno";
    version = "1.13.0";
    subPackage = "cmd/initContainer";
    entrypoint = [ "/bin/kyvernopre" ];
    cmd = [];
    upstream = {
      image = "ghcr.io/kyverno/kyvernopre";
      tag = "v1.13.0";
    };
    category = "security";
    chart = "kyverno";
    description = "Kyverno init container";
  };

  kyverno-background-controller = {
    status = "source";
    source = "https://github.com/kyverno/kyverno";
    version = "1.13.0";
    subPackage = "cmd/background-controller";
    entrypoint = [ "/bin/background-controller" ];
    cmd = [];
    upstream = {
      image = "ghcr.io/kyverno/background-controller";
      tag = "v1.13.0";
    };
    category = "security";
    chart = "kyverno";
    description = "Kyverno background controller";
  };

  kyverno-cleanup-controller = {
    status = "source";
    source = "https://github.com/kyverno/kyverno";
    version = "1.13.0";
    subPackage = "cmd/cleanup-controller";
    entrypoint = [ "/bin/cleanup-controller" ];
    cmd = [];
    upstream = {
      image = "ghcr.io/kyverno/cleanup-controller";
      tag = "v1.13.0";
    };
    category = "security";
    chart = "kyverno";
    description = "Kyverno cleanup controller";
  };

  kyverno-reports-controller = {
    status = "source";
    source = "https://github.com/kyverno/kyverno";
    version = "1.13.0";
    subPackage = "cmd/reports-controller";
    entrypoint = [ "/bin/reports-controller" ];
    cmd = [];
    upstream = {
      image = "ghcr.io/kyverno/reports-controller";
      tag = "v1.13.0";
    };
    category = "security";
    chart = "kyverno";
    description = "Kyverno reports controller";
  };

  # ===========================================================================
  # SECURITY - CERT-MANAGER
  # ===========================================================================

  cert-manager-controller = {
    status = "source";
    source = "https://github.com/cert-manager/cert-manager";
    version = "1.16.2";
    subPackage = "cmd/controller";
    entrypoint = [ "/bin/cert-manager-controller" ];
    cmd = [];
    upstream = {
      image = "quay.io/jetstack/cert-manager-controller";
      tag = "v1.16.2";
    };
    category = "security";
    chart = "cert-manager";
    description = "cert-manager controller";
  };

  cert-manager-webhook = {
    status = "source";
    source = "https://github.com/cert-manager/cert-manager";
    version = "1.16.2";
    subPackage = "cmd/webhook";
    entrypoint = [ "/bin/cert-manager-webhook" ];
    cmd = [];
    upstream = {
      image = "quay.io/jetstack/cert-manager-webhook";
      tag = "v1.16.2";
    };
    category = "security";
    chart = "cert-manager";
    description = "cert-manager webhook";
  };

  cert-manager-cainjector = {
    status = "source";
    source = "https://github.com/cert-manager/cert-manager";
    version = "1.16.2";
    subPackage = "cmd/cainjector";
    entrypoint = [ "/bin/cert-manager-cainjector" ];
    cmd = [];
    upstream = {
      image = "quay.io/jetstack/cert-manager-cainjector";
      tag = "v1.16.2";
    };
    category = "security";
    chart = "cert-manager";
    description = "cert-manager CA injector";
  };

  cert-manager-startupapicheck = {
    status = "nixpkgs";
    package = "cmctl";
    entrypoint = [ "/bin/cmctl" ];
    cmd = [ "check" "api" "--wait=1m" ];
    upstream = {
      image = "quay.io/jetstack/cert-manager-startupapicheck";
      tag = "v1.16.2";
    };
    category = "security";
    chart = "cert-manager";
    description = "cert-manager startup API check";
  };

  # ===========================================================================
  # SECURITY - OTHER
  # ===========================================================================

  dex = {
    status = "nixpkgs";
    package = "dex-oidc";
    entrypoint = [ "/bin/dex" ];
    cmd = [ "serve" "/etc/dex/config.yaml" ];
    upstream = {
      image = "ghcr.io/dexidp/dex";
      tag = "v2.41.1";
    };
    category = "security";
    chart = "argocd";
    description = "Dex OIDC identity provider";
  };

  oauth2-proxy = {
    status = "nixpkgs";
    package = "oauth2-proxy";
    entrypoint = [ "/bin/oauth2-proxy" ];
    cmd = [ "--config=/etc/oauth2-proxy/oauth2-proxy.cfg" ];
    upstream = {
      image = "quay.io/oauth2-proxy/oauth2-proxy";
      tag = "v7.5.1";
    };
    category = "security";
    chart = "kube-prometheus-stack";
    description = "OAuth2 reverse proxy";
  };

  external-secrets = {
    status = "source";
    source = "https://github.com/external-secrets/external-secrets";
    version = "0.10.0";
    entrypoint = [ "/bin/external-secrets" ];
    cmd = [];
    upstream = {
      image = "ghcr.io/external-secrets/external-secrets";
      tag = "v0.10.0";
    };
    category = "security";
    chart = "external-secrets";
    description = "External Secrets Operator";
  };

  kube-rbac-proxy = {
    status = "source";
    source = "https://github.com/brancz/kube-rbac-proxy";
    version = "0.18.0";
    entrypoint = [ "/bin/kube-rbac-proxy" ];
    cmd = [];
    upstream = {
      image = "quay.io/brancz/kube-rbac-proxy";
      tag = "v0.18.0";
    };
    category = "security";
    chart = "kube-prometheus-stack";
    description = "Kubernetes RBAC proxy";
  };

  # ===========================================================================
  # GITOPS - ARGOCD
  # ===========================================================================

  argocd = {
    status = "nixpkgs";
    package = "argocd";
    entrypoint = [ "/bin/argocd" ];
    cmd = [];
    upstream = {
      image = "quay.io/argoproj/argocd";
      tag = "v2.13.0";
    };
    category = "gitops";
    chart = "argocd";
    description = "Argo CD GitOps controller";
  };

  argocd-extension-installer = {
    status = "source";
    source = "https://github.com/argoproj-labs/argocd-extension-installer";
    version = "0.0.5";
    entrypoint = [ "/bin/argocd-extension-installer" ];
    cmd = [];
    upstream = {
      image = "quay.io/argoprojlabs/argocd-extension-installer";
      tag = "v0.0.5";
    };
    category = "gitops";
    chart = "argocd";
    description = "Argo CD extension installer";
  };

  # ===========================================================================
  # GITOPS - FLUX CD
  # ===========================================================================

  flux-cli = {
    status = "nixpkgs";
    package = "fluxcd";
    entrypoint = [ "/bin/flux" ];
    cmd = [ "--help" ];
    upstream = {
      image = "ghcr.io/fluxcd/flux-cli";
      tag = "v2.4.0";
    };
    category = "gitops";
    chart = "flux2";
    description = "Flux CD CLI";
  };

  flux-operator = {
    status = "nixpkgs";
    package = "fluxcd-operator";
    entrypoint = [ "/bin/flux-operator" ];
    cmd = [];
    upstream = {
      image = "ghcr.io/controlplaneio-fluxcd/flux-operator";
      tag = "v0.14.0";
    };
    category = "gitops";
    chart = "flux-operator";
    description = "Flux Operator";
  };

  source-controller = {
    status = "source";
    source = "https://github.com/fluxcd/source-controller";
    version = "1.7.4";
    entrypoint = [ "/bin/source-controller" ];
    cmd = [];
    upstream = {
      image = "ghcr.io/fluxcd/source-controller";
      tag = "v1.7.4";
    };
    category = "gitops";
    chart = "flux2";
    description = "Flux source controller";
  };

  kustomize-controller = {
    status = "source";
    source = "https://github.com/fluxcd/kustomize-controller";
    version = "1.7.3";
    entrypoint = [ "/bin/kustomize-controller" ];
    cmd = [];
    upstream = {
      image = "ghcr.io/fluxcd/kustomize-controller";
      tag = "v1.7.3";
    };
    category = "gitops";
    chart = "flux2";
    description = "Flux kustomize controller";
  };

  helm-controller = {
    status = "source";
    source = "https://github.com/fluxcd/helm-controller";
    version = "1.4.5";
    entrypoint = [ "/bin/helm-controller" ];
    cmd = [];
    upstream = {
      image = "ghcr.io/fluxcd/helm-controller";
      tag = "v1.4.5";
    };
    category = "gitops";
    chart = "flux2";
    description = "Flux helm controller";
  };

  notification-controller = {
    status = "source";
    source = "https://github.com/fluxcd/notification-controller";
    version = "1.7.5";
    entrypoint = [ "/bin/notification-controller" ];
    cmd = [];
    upstream = {
      image = "ghcr.io/fluxcd/notification-controller";
      tag = "v1.7.5";
    };
    category = "gitops";
    chart = "flux2";
    description = "Flux notification controller";
  };

  image-automation-controller = {
    status = "source";
    source = "https://github.com/fluxcd/image-automation-controller";
    version = "1.0.4";
    entrypoint = [ "/bin/image-automation-controller" ];
    cmd = [];
    upstream = {
      image = "ghcr.io/fluxcd/image-automation-controller";
      tag = "v1.0.4";
    };
    category = "gitops";
    chart = "flux2";
    description = "Flux image automation controller";
  };

  image-reflector-controller = {
    status = "source";
    source = "https://github.com/fluxcd/image-reflector-controller";
    version = "1.0.4";
    entrypoint = [ "/bin/image-reflector-controller" ];
    cmd = [];
    upstream = {
      image = "ghcr.io/fluxcd/image-reflector-controller";
      tag = "v1.0.4";
    };
    category = "gitops";
    chart = "flux2";
    description = "Flux image reflector controller";
  };

  # ===========================================================================
  # OPERATORS - KEDA
  # ===========================================================================

  keda = {
    status = "source";
    source = "https://github.com/kedacore/keda";
    version = "2.16.1";
    subPackage = "cmd/operator";
    entrypoint = [ "/bin/keda" ];
    cmd = [];
    upstream = {
      image = "ghcr.io/kedacore/keda";
      tag = "2.16.1";
    };
    category = "operators";
    chart = "keda";
    description = "KEDA event-driven autoscaler";
  };

  keda-metrics-apiserver = {
    status = "source";
    source = "https://github.com/kedacore/keda";
    version = "2.16.1";
    subPackage = "cmd/adapter";
    entrypoint = [ "/bin/keda-adapter" ];
    cmd = [];
    upstream = {
      image = "ghcr.io/kedacore/keda-metrics-apiserver";
      tag = "2.16.1";
    };
    category = "operators";
    chart = "keda";
    description = "KEDA metrics API server";
  };

  keda-admission-webhooks = {
    status = "source";
    source = "https://github.com/kedacore/keda";
    version = "2.16.1";
    subPackage = "cmd/webhooks";
    entrypoint = [ "/bin/keda-admission-webhooks" ];
    cmd = [];
    upstream = {
      image = "ghcr.io/kedacore/keda-admission-webhooks";
      tag = "2.16.1";
    };
    category = "operators";
    chart = "keda";
    description = "KEDA admission webhooks";
  };

  # ===========================================================================
  # OPERATORS - OTHER
  # ===========================================================================

  velero = {
    status = "nixpkgs";
    package = "velero";
    entrypoint = [ "/bin/velero" ];
    cmd = [];
    upstream = {
      image = "velero/velero";
      tag = "v1.14.1";
    };
    category = "operators";
    chart = "velero";
    description = "Velero backup and restore";
  };

  dragonfly-operator = {
    status = "source";
    source = "https://github.com/dragonflydb/dragonfly-operator";
    version = "1.1.11";
    entrypoint = [ "/bin/dragonfly-operator" ];
    cmd = [];
    upstream = {
      image = "docker.dragonflydb.io/dragonflydb/operator";
      tag = "v1.1.11";
    };
    category = "operators";
    chart = "dragonfly-operator";
    description = "DragonflyDB Kubernetes operator";
  };

  external-dns = {
    status = "source";
    source = "https://github.com/kubernetes-sigs/external-dns";
    version = "0.16.1";
    entrypoint = [ "/bin/external-dns" ];
    cmd = [];
    upstream = {
      image = "registry.k8s.io/external-dns/external-dns";
      tag = "v0.16.1";
    };
    category = "operators";
    chart = "external-dns";
    description = "External DNS controller";
  };

  cloudnative-pg = {
    status = "source";
    source = "https://github.com/cloudnative-pg/cloudnative-pg";
    version = "1.27.1";
    entrypoint = [ "/bin/manager" ];
    cmd = [];
    upstream = {
      image = "ghcr.io/cloudnative-pg/cloudnative-pg";
      tag = "1.27.1";
    };
    category = "operators";
    chart = "cloudnative-pg";
    description = "CloudNativePG operator for PostgreSQL";
  };

  # ===========================================================================
  # STORAGE
  # ===========================================================================

  minio = {
    status = "nixpkgs";
    package = "minio";
    entrypoint = [ "/bin/minio" ];
    cmd = [ "server" "/data" ];
    upstream = {
      image = "quay.io/minio/minio";
      tag = "RELEASE.2024-10-02T17-50-41Z";
    };
    category = "storage";
    chart = "minio";
    description = "MinIO object storage server";
  };

  minio-client = {
    status = "nixpkgs";
    package = "minio-client";
    entrypoint = [ "/bin/mc" ];
    cmd = [ "--help" ];
    upstream = {
      image = "quay.io/minio/mc";
      tag = "RELEASE.2024-10-02T08-27-28Z";
    };
    category = "storage";
    chart = "minio";
    description = "MinIO client";
  };

  memcached = {
    status = "nixpkgs";
    package = "memcached";
    entrypoint = [ "/bin/memcached" ];
    cmd = [ "-m" "64" ];
    upstream = {
      image = "memcached";
      tag = "1.6.23-alpine";
    };
    category = "storage";
    chart = "loki";
    description = "Memcached distributed memory caching";
  };

  seaweedfs = {
    status = "nixpkgs";
    package = "seaweedfs";
    entrypoint = [ "/bin/weed" ];
    cmd = [ "server" ];
    upstream = {
      image = "chrislusf/seaweedfs";
      tag = "3.80";
    };
    category = "storage";
    chart = "seaweedfs";
    description = "SeaweedFS distributed file system";
  };

  # ===========================================================================
  # DATABASES
  # ===========================================================================

  postgres = {
    status = "nixpkgs";
    package = "postgresql";
    entrypoint = [ "/bin/postgres" ];
    cmd = [];
    upstream = {
      image = "docker.io/library/postgres";
      tag = "17";
    };
    category = "database";
    description = "PostgreSQL database";
  };

  pgpool = {
    status = "nixpkgs";
    package = "pgpool";
    entrypoint = [ "/bin/pgpool" ];
    cmd = [ "-n" ];
    upstream = {
      image = "docker.io/bitnami/pgpool";
      tag = "4.5.5";
    };
    category = "database";
    chart = "postgresql-ha";
    description = "Pgpool-II connection pooling for PostgreSQL";
  };

  postgres-exporter = {
    status = "nixpkgs";
    package = "prometheus-postgres-exporter";
    entrypoint = [ "/bin/postgres_exporter" ];
    cmd = [];
    upstream = {
      image = "quay.io/prometheuscommunity/postgres-exporter";
      tag = "v0.15.0";
    };
    category = "database";
    chart = "postgresql-ha";
    description = "Prometheus exporter for PostgreSQL";
  };

  redis = {
    status = "nixpkgs";
    package = "redis";
    entrypoint = [ "/bin/redis-server" ];
    cmd = [];
    upstream = {
      image = "docker.io/library/redis";
      tag = "7-alpine";
    };
    category = "database";
    description = "Redis in-memory data store";
  };

  valkey = {
    status = "nixpkgs";
    package = "valkey";
    entrypoint = [ "/bin/valkey-server" ];
    cmd = [];
    upstream = {
      image = "docker.io/valkey/valkey";
      tag = "8";
    };
    category = "database";
    description = "Valkey in-memory data store";
  };

  mariadb = {
    status = "nixpkgs";
    package = "mariadb";
    entrypoint = [ "/bin/mariadbd" ];
    cmd = [];
    upstream = {
      image = "docker.io/library/mariadb";
      tag = "11";
    };
    category = "database";
    description = "MariaDB database server";
  };

  mongodb = {
    status = "nixpkgs";
    package = "mongodb";
    entrypoint = [ "/bin/mongod" ];
    cmd = [];
    upstream = {
      image = "docker.io/library/mongo";
      tag = "7";
    };
    category = "database";
    description = "MongoDB document database";
  };

  # ===========================================================================
  # GIT SERVICES
  # ===========================================================================

  gitea = {
    status = "nixpkgs";
    package = "gitea";
    entrypoint = [ "/bin/gitea" ];
    cmd = [];
    upstream = {
      image = "gitea/gitea";
      tag = "1.22";
    };
    category = "git";
    chart = "gitea";
    description = "Gitea self-hosted Git service";
  };

  # ===========================================================================
  # WEB SERVERS
  # ===========================================================================

  nginx = {
    status = "nixpkgs";
    package = "nginx";
    entrypoint = [ "/bin/nginx" ];
    cmd = [ "-g" "daemon off;" ];
    upstream = {
      image = "docker.io/library/nginx";
      tag = "1-alpine";
    };
    category = "web";
    description = "NGINX web server";
  };

  caddy = {
    status = "nixpkgs";
    package = "caddy";
    entrypoint = [ "/bin/caddy" ];
    cmd = [ "run" "--config" "/etc/caddy/Caddyfile" ];
    upstream = {
      image = "docker.io/library/caddy";
      tag = "2-alpine";
    };
    category = "web";
    description = "Caddy web server";
  };

  haproxy = {
    status = "nixpkgs";
    package = "haproxy";
    entrypoint = [ "/bin/haproxy" ];
    cmd = [ "-f" "/etc/haproxy/haproxy.cfg" ];
    upstream = {
      image = "docker.io/library/haproxy";
      tag = "2.9-alpine";
    };
    category = "web";
    chart = "argocd";
    description = "HAProxy load balancer";
  };

  hugo = {
    status = "nixpkgs";
    package = "hugo";
    entrypoint = [ "/bin/hugo" ];
    cmd = [ "server" ];
    upstream = {
      image = "docker.io/klakegg/hugo";
      tag = "0.111.3";
    };
    category = "web";
    description = "Hugo static site generator";
  };

  # ===========================================================================
  # CLI TOOLS
  # ===========================================================================

  kubectl = {
    status = "nixpkgs";
    package = "kubectl";
    entrypoint = [ "/bin/kubectl" ];
    cmd = [ "--help" ];
    upstream = {
      image = "docker.io/bitnami/kubectl";
      tag = "1.31";
    };
    category = "cli";
    description = "Kubernetes CLI";
  };

  helm = {
    status = "nixpkgs";
    package = "kubernetes-helm";
    entrypoint = [ "/bin/helm" ];
    cmd = [ "--help" ];
    upstream = {
      image = "docker.io/alpine/helm";
      tag = "3.16";
    };
    category = "cli";
    description = "Helm package manager for Kubernetes";
  };

  kubernetes-helm = {
    status = "nixpkgs";
    package = "kubernetes-helm";
    entrypoint = [ "/bin/helm" ];
    cmd = [ "--help" ];
    upstream = {
      image = "docker.io/alpine/helm";
      tag = "3.16";
    };
    category = "cli";
    description = "Helm package manager for Kubernetes";
  };

  cosign = {
    status = "nixpkgs";
    package = "cosign";
    entrypoint = [ "/bin/cosign" ];
    cmd = [ "--help" ];
    upstream = {
      image = "gcr.io/projectsigstore/cosign";
      tag = "v2.2.0";
    };
    category = "cli";
    description = "Container signing tool";
  };

  grype = {
    status = "nixpkgs";
    package = "grype";
    entrypoint = [ "/bin/grype" ];
    cmd = [ "--help" ];
    upstream = {
      image = "anchore/grype";
      tag = "v0.74.0";
    };
    category = "cli";
    description = "Vulnerability scanner for containers";
  };

  crane = {
    status = "nixpkgs";
    package = "crane";
    entrypoint = [ "/bin/crane" ];
    cmd = [ "--help" ];
    upstream = {
      image = "gcr.io/go-containerregistry/crane";
      tag = "v0.19.0";
    };
    category = "cli";
    description = "Container registry manipulation tool";
  };

  curl = {
    status = "nixpkgs";
    package = "curl";
    entrypoint = [ "/bin/curl" ];
    cmd = [ "--help" ];
    upstream = {
      image = "curlimages/curl";
      tag = "8.5.0";
    };
    category = "cli";
    description = "cURL HTTP client";
  };

  git = {
    status = "nixpkgs";
    package = "git";
    entrypoint = [ "/bin/git" ];
    cmd = [ "--help" ];
    upstream = {
      image = "docker.io/bitnami/git";
      tag = "2.43";
    };
    category = "cli";
    description = "Git version control";
  };

  sops = {
    status = "nixpkgs";
    package = "sops";
    entrypoint = [ "/bin/sops" ];
    cmd = [ "--help" ];
    upstream = {
      image = "mozilla/sops";
      tag = "v3.8.0";
    };
    category = "cli";
    description = "SOPS secrets management";
  };

  bash = {
    status = "nixpkgs";
    package = "bash";
    entrypoint = [ "/bin/bash" ];
    cmd = [];
    upstream = {
      image = "docker.io/library/bash";
      tag = "5";
    };
    category = "cli";
    description = "Bash shell";
  };

  busybox = {
    status = "nixpkgs";
    package = "busybox";
    entrypoint = [ "/bin/sh" ];
    cmd = [];
    upstream = {
      image = "docker.io/library/busybox";
      tag = "1.36";
    };
    category = "cli";
    description = "BusyBox minimal utilities";
  };

  # ===========================================================================
  # OTHER CHART IMAGES
  # ===========================================================================

  zookeeper = {
    status = "nixpkgs";
    package = "zookeeper";
    entrypoint = [ "/bin/zkServer.sh" ];
    cmd = [ "start-foreground" ];
    upstream = {
      image = "docker.io/bitnami/zookeeper";
      tag = "3.9";
    };
    category = "other";
    chart = "nifi";
    description = "Apache ZooKeeper coordination service";
  };

  openldap = {
    status = "nixpkgs";
    package = "openldap";
    entrypoint = [ "/bin/slapd" ];
    cmd = [ "-d" "256" ];
    upstream = {
      image = "osixia/openldap";
      tag = "1.5.0";
    };
    category = "other";
    description = "OpenLDAP directory server";
  };

  bats = {
    status = "nixpkgs";
    package = "bats";
    entrypoint = [ "/bin/bats" ];
    cmd = [];
    upstream = {
      image = "bats/bats";
      tag = "v1.10.0";
    };
    category = "other";
    chart = "kube-prometheus-stack";
    description = "Bash Automated Testing System";
  };

  shellcheck = {
    status = "nixpkgs";
    package = "shellcheck";
    entrypoint = [ "/bin/shellcheck" ];
    cmd = [ "--help" ];
    upstream = {
      image = "koalaman/shellcheck";
      tag = "v0.9.0";
    };
    category = "other";
    chart = "argocd";
    description = "ShellCheck static analysis for shell scripts";
  };

  geoipupdate = {
    status = "nixpkgs";
    package = "geoipupdate";
    entrypoint = [ "/bin/geoipupdate" ];
    cmd = [];
    upstream = {
      image = "ghcr.io/maxmind/geoipupdate";
      tag = "v7.0";
    };
    category = "other";
    chart = "alloy";
    description = "MaxMind GeoIP database updater";
  };

  # ===========================================================================
  # LANGUAGE RUNTIMES
  # ===========================================================================

  python = {
    status = "nixpkgs";
    package = "python3";
    entrypoint = [ "/bin/python3" ];
    cmd = [];
    upstream = {
      image = "docker.io/library/python";
      tag = "3.12-slim";
    };
    category = "runtime";
    description = "Python runtime";
  };

  python-fips = {
    status = "nixpkgs";
    package = "python3";
    entrypoint = [ "/bin/python3" ];
    cmd = [];
    upstream = {
      image = "docker.io/library/python";
      tag = "3.12-slim";
    };
    category = "runtime";
    description = "Python runtime (FIPS compatible)";
  };

  node = {
    status = "nixpkgs";
    package = "nodejs";
    entrypoint = [ "/bin/node" ];
    cmd = [];
    upstream = {
      image = "docker.io/library/node";
      tag = "22-slim";
    };
    category = "runtime";
    description = "Node.js runtime";
  };

  go = {
    status = "nixpkgs";
    package = "go";
    entrypoint = [ "/bin/go" ];
    cmd = [ "version" ];
    upstream = {
      image = "docker.io/library/golang";
      tag = "1.23";
    };
    category = "runtime";
    description = "Go programming language";
  };

  rust = {
    status = "nixpkgs";
    package = "rustc";
    entrypoint = [ "/bin/rustc" ];
    cmd = [ "--version" ];
    upstream = {
      image = "docker.io/library/rust";
      tag = "1.82-slim";
    };
    category = "runtime";
    description = "Rust programming language";
  };

  jdk = {
    status = "nixpkgs";
    package = "openjdk";
    entrypoint = [ "/bin/java" ];
    cmd = [ "-version" ];
    upstream = {
      image = "docker.io/library/eclipse-temurin";
      tag = "21-jdk";
    };
    category = "runtime";
    description = "Java Development Kit";
  };

  jre = {
    status = "nixpkgs";
    package = "openjdk";
    entrypoint = [ "/bin/java" ];
    cmd = [ "-version" ];
    upstream = {
      image = "docker.io/library/eclipse-temurin";
      tag = "21-jre";
    };
    category = "runtime";
    description = "Java Runtime Environment";
  };

  dotnet = {
    status = "nixpkgs";
    package = "dotnet-sdk";
    entrypoint = [ "/bin/dotnet" ];
    cmd = [ "--info" ];
    upstream = {
      image = "mcr.microsoft.com/dotnet/sdk";
      tag = "8.0";
    };
    category = "runtime";
    description = ".NET SDK";
  };

  aspnet-runtime = {
    status = "nixpkgs";
    package = "dotnet-aspnetcore";
    entrypoint = [ "/bin/dotnet" ];
    cmd = [];
    upstream = {
      image = "mcr.microsoft.com/dotnet/aspnet";
      tag = "8.0";
    };
    category = "runtime";
    description = "ASP.NET Core runtime";
  };

  ruby = {
    status = "nixpkgs";
    package = "ruby";
    entrypoint = [ "/bin/ruby" ];
    cmd = [ "--version" ];
    upstream = {
      image = "docker.io/library/ruby";
      tag = "3.3-slim";
    };
    category = "runtime";
    description = "Ruby runtime";
  };

  php = {
    status = "nixpkgs";
    package = "php";
    entrypoint = [ "/bin/php" ];
    cmd = [ "-v" ];
    upstream = {
      image = "docker.io/library/php";
      tag = "8.3-cli";
    };
    category = "runtime";
    description = "PHP runtime";
  };

  # ===========================================================================
  # NIX TOOLS
  # ===========================================================================

  nix = {
    status = "nixpkgs";
    package = "nix";
    entrypoint = [ "/bin/nix" ];
    cmd = [ "--version" ];
    category = "nix";
    description = "Nix package manager";
  };

  nix-flakes = {
    status = "nixpkgs";
    package = "nix";
    entrypoint = [ "/bin/nix" ];
    cmd = [ "--version" ];
    category = "nix";
    description = "Nix with flakes enabled";
  };

  nix-unstable = {
    status = "nixpkgs";
    package = "nix";
    entrypoint = [ "/bin/nix" ];
    cmd = [ "--version" ];
    category = "nix";
    description = "Nix unstable";
  };

  cachix = {
    status = "nixpkgs";
    package = "cachix";
    entrypoint = [ "/bin/cachix" ];
    cmd = [ "--help" ];
    category = "nix";
    description = "Cachix binary cache client";
  };

  cachix-flakes = {
    status = "nixpkgs";
    package = "cachix";
    entrypoint = [ "/bin/cachix" ];
    cmd = [ "--help" ];
    category = "nix";
    description = "Cachix with flakes support";
  };

  devenv = {
    status = "nixpkgs";
    package = "devenv";
    entrypoint = [ "/bin/devenv" ];
    cmd = [ "--help" ];
    category = "nix";
    description = "devenv development environments";
  };

  attic = {
    status = "nixpkgs";
    package = "attic-client";
    entrypoint = [ "/bin/attic" ];
    cmd = [ "--help" ];
    category = "nix";
    description = "Attic Nix binary cache";
  };

  # ===========================================================================
  # BUILD TOOLS
  # ===========================================================================

  gradle = {
    status = "nixpkgs";
    package = "gradle";
    entrypoint = [ "/bin/gradle" ];
    cmd = [ "--version" ];
    upstream = {
      image = "docker.io/library/gradle";
      tag = "8-jdk21";
    };
    category = "build";
    description = "Gradle build tool";
  };

  maven = {
    status = "nixpkgs";
    package = "maven";
    entrypoint = [ "/bin/mvn" ];
    cmd = [ "--version" ];
    upstream = {
      image = "docker.io/library/maven";
      tag = "3.9-eclipse-temurin-21";
    };
    category = "build";
    description = "Apache Maven build tool";
  };

  cpp-build-env = {
    status = "nixpkgs";
    package = "gcc";
    entrypoint = [ "/bin/gcc" ];
    cmd = [ "--version" ];
    category = "build";
    description = "C/C++ build environment";
  };

  cpp-runtime = {
    status = "nixpkgs";
    package = "glibc";
    entrypoint = [ "/bin/sh" ];
    cmd = [];
    category = "build";
    description = "C/C++ runtime";
  };

  rust-build-env = {
    status = "nixpkgs";
    package = "rustc";
    entrypoint = [ "/bin/rustc" ];
    cmd = [ "--version" ];
    category = "build";
    description = "Rust build environment";
  };

  glibc-dynamic = {
    status = "nixpkgs";
    package = "glibc";
    entrypoint = [ "/bin/sh" ];
    cmd = [];
    category = "build";
    description = "Dynamic glibc base image";
  };

  static = {
    status = "nixpkgs";
    package = "busybox";
    entrypoint = [ "/bin/sh" ];
    cmd = [];
    category = "build";
    description = "Static base image";
  };

  # ===========================================================================
  # DEVOPS
  # ===========================================================================

  docker-compose = {
    status = "nixpkgs";
    package = "docker-compose";
    entrypoint = [ "/bin/docker-compose" ];
    cmd = [ "--version" ];
    category = "devops";
    description = "Docker Compose";
  };

  dive = {
    status = "nixpkgs";
    package = "dive";
    entrypoint = [ "/bin/dive" ];
    cmd = [ "--help" ];
    category = "devops";
    description = "Container image explorer";
  };

  ko = {
    status = "nixpkgs";
    package = "ko";
    entrypoint = [ "/bin/ko" ];
    cmd = [ "--help" ];
    category = "devops";
    description = "Ko container builder for Go";
  };

  wait-for-it = {
    status = "custom";
    version = "1.0.0";
    entrypoint = [ "/bin/wait-for-it" ];
    cmd = [ "--help" ];
    category = "devops";
    description = "Wait for service availability";
  };

  # ===========================================================================
  # DEV TOOLS
  # ===========================================================================

  devcontainer = {
    status = "custom";
    entrypoint = [ "/bin/bash" ];
    cmd = [];
    category = "dev";
    description = "Development container";
  };

  pocket-id = {
    status = "custom";
    version = "1.0.0";
    entrypoint = [ "/bin/pocket-id" ];
    cmd = [];
    category = "dev";
    description = "Pocket ID identity service";
  };

  maddy = {
    status = "nixpkgs";
    package = "maddy";
    entrypoint = [ "/bin/maddy" ];
    cmd = [ "run" ];
    category = "dev";
    description = "Maddy mail server";
  };
}
