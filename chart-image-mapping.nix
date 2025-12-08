# Chart Image Mapping
# ===================
# Maps upstream container images used in Helm charts to Nix-built equivalents.
# This file is used to:
# 1. Track which images need to be built
# 2. Generate Helm values overrides for chart deployments
# 3. Track build status and priority
#
# Status values:
#   - "available": Already built in this repo
#   - "nixpkgs": Package available in nixpkgs, needs container build
#   - "buildable": Can be built from source with Nix
#   - "complex": Requires significant effort (large Java/C++ projects)
#   - "skip": Not needed or use upstream

{
  # ===========================================
  # TIER 1: Base Images (Already Built or Easy)
  # ===========================================
  base = {
    busybox = {
      upstream = [ "busybox:1.28" "busybox:1.32.0" "busybox:1.34.1" "busybox:1.35" "library/busybox:1.31.1" ];
      nixImage = "busybox";
      status = "available";
      usedBy = [ "argocd" "istiod" "loki" "kube-prometheus-stack" ];
    };

    curl = {
      upstream = [ "curlimages/curl:7.85.0" ];
      nixImage = "curl";
      status = "available";
      usedBy = [ "kube-prometheus-stack" ];
    };

    kubectl = {
      upstream = [ "bitnami/kubectl:1.30.2" "bitnami/kubectl:1.33" "docker.io/bitnami/kubectl:1.33" ];
      nixImage = "kubectl";
      status = "available";
      usedBy = [ "spark-operator" "nifi" ];
    };

    haproxy = {
      upstream = [ "public.ecr.aws/docker/library/haproxy:2.9.4-alpine" ];
      nixImage = "haproxy";
      status = "available";
      usedBy = [ "argocd" ];
    };

    redis = {
      upstream = [ "public.ecr.aws/docker/library/redis:7.2.4-alpine" ];
      nixImage = "redis";
      status = "available";
      usedBy = [ "argocd" ];
    };

    memcached = {
      upstream = [ "memcached:1.6.23-alpine" ];
      nixImage = "memcached";
      status = "nixpkgs";
      package = "memcached";
      usedBy = [ "loki" ];
    };

    nginx = {
      upstream = [ "nginxinc/nginx-unprivileged:1.27-alpine" ];
      nixImage = "nginx";
      status = "available";
      usedBy = [ "nifi" ];
    };

    shellcheck = {
      upstream = [ "koalaman/shellcheck:v0.5.0" ];
      nixImage = "shellcheck";
      status = "nixpkgs";
      package = "shellcheck";
      usedBy = [ "argocd" ];
    };

    bats = {
      upstream = [ "bats/bats:v1.4.1" "dduportal/bats:0.4.0" "docker.io/bats/bats:v1.4.1" ];
      nixImage = "bats";
      status = "nixpkgs";
      package = "bats";
      usedBy = [ "kube-prometheus-stack" "kyverno" ];
    };
  };

  # ===========================================
  # TIER 2: Observability Stack
  # ===========================================
  observability = {
    prometheus = {
      upstream = [ "prometheus/prometheus:v2.54.1" "quay.io/prometheus/prometheus:v2.54.1" ];
      nixImage = "prometheus";
      status = "nixpkgs";
      package = "prometheus";
      usedBy = [ "kube-prometheus-stack" ];
    };

    alertmanager = {
      upstream = [ "prometheus/alertmanager:v0.27.0" "quay.io/prometheus/alertmanager:v0.27.0" ];
      nixImage = "alertmanager";
      status = "nixpkgs";
      package = "prometheus-alertmanager";
      usedBy = [ "kube-prometheus-stack" ];
    };

    node-exporter = {
      upstream = [ "quay.io/prometheus/node-exporter:v1.8.2" ];
      nixImage = "node-exporter";
      status = "nixpkgs";
      package = "prometheus-node-exporter";
      usedBy = [ "kube-prometheus-stack" ];
    };

    kube-state-metrics = {
      upstream = [ "registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.13.0" ];
      nixImage = "kube-state-metrics";
      status = "nixpkgs";
      package = "kube-state-metrics";
      usedBy = [ "kube-prometheus-stack" ];
    };

    prometheus-operator = {
      upstream = [ "quay.io/prometheus-operator/prometheus-operator:v0.77.1" ];
      nixImage = "prometheus-operator";
      status = "nixpkgs";
      package = "prometheus-operator";
      usedBy = [ "kube-prometheus-stack" ];
    };

    prometheus-adapter = {
      upstream = [ "registry.k8s.io/prometheus-adapter/prometheus-adapter:v0.12.0" ];
      nixImage = "prometheus-adapter";
      status = "nixpkgs";
      package = "prometheus-adapter";
      usedBy = [ "prometheus-adapter" ];
    };

    grafana = {
      upstream = [ "docker.io/grafana/grafana:11.2.1" ];
      nixImage = "grafana";
      status = "nixpkgs";
      package = "grafana";
      usedBy = [ "kube-prometheus-stack" ];
    };

    loki = {
      upstream = [ "grafana/loki:null" ];
      nixImage = "loki";
      status = "nixpkgs";
      package = "grafana-loki";
      usedBy = [ "loki" ];
    };

    tempo = {
      upstream = [ "grafana/tempo:2.5.0" ];
      nixImage = "tempo";
      status = "nixpkgs";
      package = "tempo";
      usedBy = [ "tempo" ];
    };

    alloy = {
      upstream = [ "docker.io/grafana/alloy:v1.5.1" ];
      nixImage = "alloy";
      status = "nixpkgs";
      package = "grafana-alloy";
      usedBy = [ "alloy" ];
    };

    thanos = {
      upstream = [ "thanos/thanos:v0.36.1" ];
      nixImage = "thanos";
      status = "nixpkgs";
      package = "thanos";
      usedBy = [ "kube-prometheus-stack" ];
    };

    memcached-exporter = {
      upstream = [ "prom/memcached-exporter:v0.14.2" ];
      nixImage = "memcached-exporter";
      status = "nixpkgs";
      package = "prometheus-memcached-exporter";
      usedBy = [ "loki" ];
    };

    redis-exporter = {
      upstream = [ "public.ecr.aws/bitnami/redis-exporter:1.58.0" ];
      nixImage = "redis-exporter";
      status = "nixpkgs";
      package = "prometheus-redis-exporter";
      usedBy = [ "argocd" ];
    };
  };

  # ===========================================
  # TIER 3: Security & Auth
  # ===========================================
  security = {
    vault = {
      upstream = [ "hashicorp/vault:1.16.1" ];
      nixImage = "vault";
      status = "nixpkgs";
      package = "vault";
      usedBy = [ "vault" ];
    };

    vault-k8s = {
      upstream = [ "hashicorp/vault-k8s:1.4.1" ];
      nixImage = "vault-k8s";
      status = "buildable";
      source = "https://github.com/hashicorp/vault-k8s";
      usedBy = [ "vault" ];
    };

    vault-csi-provider = {
      upstream = [ "hashicorp/vault-csi-provider:1.4.2" ];
      nixImage = "vault-csi-provider";
      status = "buildable";
      source = "https://github.com/hashicorp/vault-csi-provider";
      usedBy = [ "vault" ];
    };

    dex = {
      upstream = [ "ghcr.io/dexidp/dex:v2.41.1" ];
      nixImage = "dex";
      status = "nixpkgs";
      package = "dex-oidc";
      usedBy = [ "argocd" ];
    };

    oauth2-proxy = {
      upstream = [ "quay.io/oauth2-proxy/oauth2-proxy:v7.5.1" ];
      nixImage = "oauth2-proxy";
      status = "nixpkgs";
      package = "oauth2-proxy";
      usedBy = [ "kube-prometheus-stack" ];
    };

    cert-manager-controller = {
      upstream = [ "quay.io/jetstack/cert-manager-controller:v1.16.2" ];
      nixImage = "cert-manager-controller";
      status = "nixpkgs";
      package = "cert-manager";
      usedBy = [ "cert-manager" ];
    };

    cert-manager-webhook = {
      upstream = [ "quay.io/jetstack/cert-manager-webhook:v1.16.2" ];
      nixImage = "cert-manager-webhook";
      status = "nixpkgs";
      package = "cert-manager";
      usedBy = [ "cert-manager" ];
    };

    cert-manager-cainjector = {
      upstream = [ "quay.io/jetstack/cert-manager-cainjector:v1.16.2" ];
      nixImage = "cert-manager-cainjector";
      status = "nixpkgs";
      package = "cert-manager";
      usedBy = [ "cert-manager" ];
    };

    cert-manager-startupapicheck = {
      upstream = [ "quay.io/jetstack/cert-manager-startupapicheck:v1.16.2" ];
      nixImage = "cert-manager-startupapicheck";
      status = "nixpkgs";
      package = "cmctl"; # cert-manager CLI
      usedBy = [ "cert-manager" ];
    };

    external-secrets = {
      upstream = [ "ghcr.io/external-secrets/external-secrets:v0.10.0" ];
      nixImage = "external-secrets";
      status = "nixpkgs";
      package = "external-secrets";
      usedBy = [ "external-secrets" ];
    };

    kyverno = {
      upstream = [ "ghcr.io/kyverno/kyverno:v1.13.0" ];
      nixImage = "kyverno";
      status = "nixpkgs";
      package = "kyverno";
      usedBy = [ "kyverno" ];
    };

    kyverno-cli = {
      upstream = [ "ghcr.io/kyverno/kyverno-cli:v1.13.0" ];
      nixImage = "kyverno-cli";
      status = "nixpkgs";
      package = "kyverno";
      usedBy = [ "kyverno" ];
    };

    kyvernopre = {
      upstream = [ "ghcr.io/kyverno/kyvernopre:v1.13.0" ];
      nixImage = "kyvernopre";
      status = "buildable";
      source = "https://github.com/kyverno/kyverno";
      usedBy = [ "kyverno" ];
    };

    kyverno-background-controller = {
      upstream = [ "ghcr.io/kyverno/background-controller:v1.13.0" ];
      nixImage = "kyverno-background-controller";
      status = "buildable";
      source = "https://github.com/kyverno/kyverno";
      usedBy = [ "kyverno" ];
    };

    kyverno-cleanup-controller = {
      upstream = [ "ghcr.io/kyverno/cleanup-controller:v1.13.0" ];
      nixImage = "kyverno-cleanup-controller";
      status = "buildable";
      source = "https://github.com/kyverno/kyverno";
      usedBy = [ "kyverno" ];
    };

    kyverno-reports-controller = {
      upstream = [ "ghcr.io/kyverno/reports-controller:v1.13.0" ];
      nixImage = "kyverno-reports-controller";
      status = "buildable";
      source = "https://github.com/kyverno/kyverno";
      usedBy = [ "kyverno" ];
    };

    kube-rbac-proxy = {
      upstream = [ "brancz/kube-rbac-proxy:v0.18.0" "quay.io/brancz/kube-rbac-proxy:v0.13.1" ];
      nixImage = "kube-rbac-proxy";
      status = "nixpkgs";
      package = "kube-rbac-proxy";
      usedBy = [ "kube-prometheus-stack" "dragonfly-operator" ];
    };
  };

  # ===========================================
  # TIER 4: GitOps & CD
  # ===========================================
  gitops = {
    argocd = {
      upstream = [ "quay.io/argoproj/argocd:v2.13.0" ];
      nixImage = "argocd";
      status = "nixpkgs";
      package = "argocd";
      usedBy = [ "argocd" ];
    };

    argocd-extension-installer = {
      upstream = [ "quay.io/argoprojlabs/argocd-extension-installer:v0.0.5" ];
      nixImage = "argocd-extension-installer";
      status = "buildable";
      source = "https://github.com/argoproj-labs/argocd-extension-installer";
      usedBy = [ "argocd" ];
    };
  };

  # ===========================================
  # TIER 5: Infrastructure Operators
  # ===========================================
  operators = {
    external-dns = {
      upstream = [ "registry.k8s.io/external-dns/external-dns:v0.15.0" ];
      nixImage = "external-dns";
      status = "available";
      usedBy = [ "external-dns" ];
    };

    dragonfly-operator = {
      upstream = [ "docker.dragonflydb.io/dragonflydb/operator:v1.1.11" ];
      nixImage = "dragonfly-operator";
      status = "available";
      usedBy = [ "dragonfly-operator" ];
    };

    cloudnative-pg = {
      upstream = [ "ghcr.io/cloudnative-pg/cloudnative-pg:1.26.0" ];
      nixImage = "cloudnative-pg";
      status = "buildable";
      source = "https://github.com/cloudnative-pg/cloudnative-pg";
      usedBy = [ "cloudnative-pg" ];
    };

    keda = {
      upstream = [ "ghcr.io/kedacore/keda:2.16.1" ];
      nixImage = "keda";
      status = "nixpkgs";
      package = "keda";
      usedBy = [ "keda" ];
    };

    keda-metrics-apiserver = {
      upstream = [ "ghcr.io/kedacore/keda-metrics-apiserver:2.16.1" ];
      nixImage = "keda-metrics-apiserver";
      status = "buildable";
      source = "https://github.com/kedacore/keda";
      usedBy = [ "keda" ];
    };

    keda-admission-webhooks = {
      upstream = [ "ghcr.io/kedacore/keda-admission-webhooks:2.16.1" ];
      nixImage = "keda-admission-webhooks";
      status = "buildable";
      source = "https://github.com/kedacore/keda";
      usedBy = [ "keda" ];
    };

    velero = {
      upstream = [ "velero/velero:v1.14.1" ];
      nixImage = "velero";
      status = "nixpkgs";
      package = "velero";
      usedBy = [ "velero" ];
    };

    crossplane = {
      upstream = [ "xpkg.upbound.io/crossplane/crossplane:*" ];
      nixImage = "crossplane";
      status = "nixpkgs";
      package = "crossplane-cli";
      usedBy = [ "crossplane" ];
    };

    reflector = {
      upstream = [ "docker.io/emberstack/kubernetes-reflector:9.1.41" ];
      nixImage = "reflector";
      status = "buildable";
      source = "https://github.com/emberstack/kubernetes-reflector";
      usedBy = [ "reflector" ];
    };

    reloader = {
      upstream = [ "stakater/reloader:*" ];
      nixImage = "reloader";
      status = "buildable";
      source = "https://github.com/stakater/Reloader";
      usedBy = [ "reloader" ];
    };

    configmap-reload = {
      upstream = [ "ghcr.io/jimmidyson/configmap-reload:v0.12.0" "jimmidyson/configmap-reload:v0.12.0" ];
      nixImage = "configmap-reload";
      status = "buildable";
      source = "https://github.com/jimmidyson/configmap-reload";
      usedBy = [ "alloy" "kube-prometheus-stack" ];
    };

    k8s-sidecar = {
      upstream = [ "kiwigrid/k8s-sidecar:1.27.4" "kiwigrid/k8s-sidecar:1.27.5" "quay.io/kiwigrid/k8s-sidecar:1.27.4" ];
      nixImage = "k8s-sidecar";
      status = "buildable";
      source = "https://github.com/kiwigrid/k8s-sidecar";
      usedBy = [ "kube-prometheus-stack" "loki" ];
    };

    snapshot-controller = {
      upstream = [ "registry.k8s.io/sig-storage/snapshot-controller:v8.1.0" ];
      nixImage = "snapshot-controller";
      status = "buildable";
      source = "https://github.com/kubernetes-csi/external-snapshotter";
      usedBy = [ "snapshot-controller" ];
    };

    snapshot-validation-webhook = {
      upstream = [ "registry.k8s.io/sig-storage/snapshot-validation-webhook:v8.1.0" ];
      nixImage = "snapshot-validation-webhook";
      status = "buildable";
      source = "https://github.com/kubernetes-csi/external-snapshotter";
      usedBy = [ "snapshot-controller" ];
    };
  };

  # ===========================================
  # TIER 6: CSI Drivers
  # ===========================================
  csi = {
    csi-attacher = {
      upstream = [ "registry.k8s.io/sig-storage/csi-attacher:v4.6.1" ];
      nixImage = "csi-attacher";
      status = "buildable";
      source = "https://github.com/kubernetes-csi/external-attacher";
      usedBy = [ "rook-ceph" ];
    };

    csi-provisioner = {
      upstream = [ "registry.k8s.io/sig-storage/csi-provisioner:v5.0.1" ];
      nixImage = "csi-provisioner";
      status = "buildable";
      source = "https://github.com/kubernetes-csi/external-provisioner";
      usedBy = [ "rook-ceph" ];
    };

    csi-resizer = {
      upstream = [ "registry.k8s.io/sig-storage/csi-resizer:v1.11.1" ];
      nixImage = "csi-resizer";
      status = "buildable";
      source = "https://github.com/kubernetes-csi/external-resizer";
      usedBy = [ "rook-ceph" ];
    };

    csi-snapshotter = {
      upstream = [ "registry.k8s.io/sig-storage/csi-snapshotter:v8.2.0" ];
      nixImage = "csi-snapshotter";
      status = "buildable";
      source = "https://github.com/kubernetes-csi/external-snapshotter";
      usedBy = [ "rook-ceph" ];
    };

    csi-node-driver-registrar = {
      upstream = [ "registry.k8s.io/sig-storage/csi-node-driver-registrar:v2.11.1" ];
      nixImage = "csi-node-driver-registrar";
      status = "buildable";
      source = "https://github.com/kubernetes-csi/node-driver-registrar";
      usedBy = [ "rook-ceph" ];
    };

    cephcsi = {
      upstream = [ "quay.io/cephcsi/cephcsi:v3.13.0" ];
      nixImage = "cephcsi";
      status = "complex";
      source = "https://github.com/ceph/ceph-csi";
      usedBy = [ "rook-ceph" ];
    };
  };

  # ===========================================
  # TIER 7: Service Mesh
  # ===========================================
  serviceMesh = {
    istio-pilot = {
      upstream = [ "docker.io/istio/pilot:1.24.0" ];
      nixImage = "istiod";
      status = "complex";
      source = "https://github.com/istio/istio";
      usedBy = [ "istiod" ];
    };
  };

  # ===========================================
  # TIER 8: Storage
  # ===========================================
  storage = {
    rook-ceph = {
      upstream = [ "docker.io/rook/ceph:v1.16.1" ];
      nixImage = "rook-ceph";
      status = "complex";
      source = "https://github.com/rook/rook";
      usedBy = [ "rook-ceph" "rook-ceph-cluster" ];
    };

    ceph = {
      upstream = [ "quay.io/ceph/ceph:v19.2.0" ];
      nixImage = "ceph";
      status = "complex";
      source = "https://github.com/ceph/ceph";
      usedBy = [ "rook-ceph-cluster" ];
    };

    minio = {
      upstream = [ "quay.io/minio/minio:RELEASE.2022-09-17T00-09-45Z" ];
      nixImage = "minio";
      status = "nixpkgs";
      package = "minio";
      usedBy = [ "loki" "tempo" ];
    };

    mc = {
      upstream = [ "quay.io/minio/mc:RELEASE.2022-09-16T09-16-47Z" ];
      nixImage = "minio-client";
      status = "nixpkgs";
      package = "minio-client";
      usedBy = [ "loki" ];
    };

    spegel = {
      upstream = [ "ghcr.io/spegel-org/spegel:*" ];
      nixImage = "spegel";
      status = "buildable";
      source = "https://github.com/spegel-org/spegel";
      usedBy = [ "spegel" ];
    };
  };

  # ===========================================
  # TIER 9: ML Platform (Complex)
  # ===========================================
  mlPlatform = {
    spark-operator = {
      upstream = [ "ghcr.io/kubeflow/spark-operator/controller:2.4.0" ];
      nixImage = "spark-operator";
      status = "buildable";
      source = "https://github.com/kubeflow/spark-operator";
      usedBy = [ "spark-operator" ];
    };

    nifi = {
      upstream = [ "apache/nifi:1.23.2" ];
      nixImage = "nifi";
      status = "complex";
      source = "https://github.com/apache/nifi";
      note = "Large Java application";
      usedBy = [ "apache-nifi" ];
    };

    nifi-registry = {
      upstream = [ "apache/nifi-registry:0.8.0" ];
      nixImage = "nifi-registry";
      status = "complex";
      source = "https://github.com/apache/nifi";
      usedBy = [ "apache-nifi" ];
    };

    nifi-toolkit = {
      upstream = [ "apache/nifi-toolkit:1.12.1" ];
      nixImage = "nifi-toolkit";
      status = "complex";
      source = "https://github.com/apache/nifi";
      usedBy = [ "apache-nifi" ];
    };

    mlflow = {
      upstream = [ "burakince/mlflow:2.20.3" ];
      nixImage = "mlflow";
      status = "nixpkgs";
      package = "mlflow";
      usedBy = [ "mlflow" ];
    };

    kubeflow-trainer = {
      upstream = [ "kubeflow/trainer:*" ];
      nixImage = "kubeflow-trainer";
      status = "buildable";
      source = "https://github.com/kubeflow/trainer";
      usedBy = [ "kubeflow-trainer" ];
    };
  };

  # ===========================================
  # TIER 10: Other Services
  # ===========================================
  other = {
    zookeeper = {
      upstream = [ "bitnami/zookeeper:3.8.0-debian-11-r5" "docker.io/bitnami/zookeeper:3.8.0-debian-11-r5" ];
      nixImage = "zookeeper";
      status = "nixpkgs";
      package = "zookeeper";
      usedBy = [ "apache-nifi" ];
    };

    openldap = {
      upstream = [ "osixia/openldap:1.2.4" ];
      nixImage = "openldap";
      status = "nixpkgs";
      package = "openldap";
      usedBy = [ "nifi" ];
    };

    keycloak = {
      upstream = [ "quay.io/keycloak/keycloak:16.1.0" ];
      nixImage = "keycloak";
      status = "complex";
      source = "https://github.com/keycloak/keycloak";
      note = "Large Java application";
      usedBy = [ "nifi" ];
    };

    k8s-dns-node-cache = {
      upstream = [ "registry.k8s.io/dns/k8s-dns-node-cache:1.23.1" ];
      nixImage = "k8s-dns-node-cache";
      status = "buildable";
      source = "https://github.com/kubernetes/dns";
      usedBy = [ "node-local-dns" ];
    };

    kube-webhook-certgen = {
      upstream = [ "registry.k8s.io/ingress-nginx/kube-webhook-certgen:v20221220-controller-v1.5.1-58-g787ea74b6" ];
      nixImage = "kube-webhook-certgen";
      status = "buildable";
      source = "https://github.com/kubernetes/ingress-nginx";
      usedBy = [ "kube-prometheus-stack" ];
    };

    geoipupdate = {
      upstream = [ "ghcr.io/maxmind/geoipupdate:v6.0" ];
      nixImage = "geoipupdate";
      status = "nixpkgs";
      package = "geoipupdate";
      usedBy = [ "alloy" ];
    };

    grafana-agent-operator = {
      upstream = [ "grafana/agent-operator:v0.39.1" ];
      nixImage = "grafana-agent-operator";
      status = "buildable";
      source = "https://github.com/grafana/agent";
      usedBy = [ "kube-prometheus-stack" ];
    };
  };
}
