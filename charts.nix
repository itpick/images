# Helm Chart Definitions
# ======================
# This file defines Helm charts to be pulled and packaged together.
# Charts are organized by category and include version pinning.
#
# Format:
#   name = {
#     url = "oci://registry/path" or "https://repo-url";
#     version = "x.y.z";
#     category = "infrastructure|ml|gitops|security|...";
#   };

{
  # Infrastructure Charts
  infrastructure = {
    alloy = {
      url = "https://grafana.github.io/helm-charts";
      chart = "alloy";
      version = "0.10.1";
      description = "Grafana Alloy - OpenTelemetry collector";
    };

    cert-manager = {
      url = "https://charts.jetstack.io";
      chart = "cert-manager";
      version = "v1.16.2";
      description = "Certificate management for Kubernetes";
    };

    cloudnative-pg = {
      url = "oci://ghcr.io/cloudnative-pg/charts/cloudnative-pg";
      version = "0.24.0";
      description = "CloudNativePG PostgreSQL operator";
    };

    crossplane = {
      url = "https://charts.crossplane.io/stable";
      chart = "crossplane";
      version = "1.18.0";
      description = "Cloud infrastructure management";
    };

    dragonfly-operator = {
      url = "oci://ghcr.io/dragonflydb/dragonfly-operator/helm/dragonfly-operator";
      version = "v1.1.11";
      description = "DragonflyDB operator";
    };

    external-dns = {
      url = "https://kubernetes-sigs.github.io/external-dns";
      chart = "external-dns";
      version = "1.15.0";
      description = "External DNS management";
    };

    keda = {
      url = "https://kedacore.github.io/charts";
      chart = "keda";
      version = "2.16.1";
      description = "Event-driven autoscaling";
    };

    node-local-dns = {
      url = "https://charts.deliveryhero.io";
      chart = "node-local-dns";
      version = "2.1.0";
      description = "Node-local DNS cache";
    };

    prometheus-adapter = {
      url = "oci://ghcr.io/prometheus-community/charts/prometheus-adapter";
      version = "4.11.0";
      description = "Prometheus metrics adapter";
    };

    reflector = {
      url = "https://emberstack.github.io/helm-charts";
      chart = "reflector";
      version = "9.1.41";
      description = "Kubernetes reflector";
    };

    reloader = {
      url = "https://stakater.github.io/stakater-charts";
      chart = "reloader";
      version = "1.2.0";
      description = "Config/secret reloader";
    };

    rook-ceph = {
      url = "https://charts.rook.io/release";
      chart = "rook-ceph";
      version = "v1.16.1";
      description = "Rook Ceph operator";
    };

    rook-ceph-cluster = {
      url = "https://charts.rook.io/release";
      chart = "rook-ceph-cluster";
      version = "v1.16.1";
      description = "Rook Ceph cluster";
    };

    snapshot-controller = {
      url = "https://piraeus.io/helm-charts";
      chart = "snapshot-controller";
      version = "3.0.6";
      description = "Volume snapshot controller";
    };

    spegel = {
      url = "oci://ghcr.io/spegel-org/helm-charts/spegel";
      version = "0.3.0";
      description = "Container image mirror";
    };
  };

  # ML Platform Charts
  ml-platform = {
    spark-operator = {
      url = "https://kubeflow.github.io/spark-operator";
      chart = "spark-operator";
      version = "2.4.0";
      description = "Spark on Kubernetes";
    };

    kubeflow-trainer = {
      url = "oci://ghcr.io/kubeflow/charts/kubeflow-trainer";
      version = "2.1.0";
      description = "Kubeflow training operator";
    };

    apache-nifi = {
      url = "https://cetic.github.io/helm-charts";
      chart = "nifi";
      version = "1.2.1";
      description = "Apache NiFi data flow";
    };

    mlflow = {
      url = "https://community-charts.github.io/helm-charts";
      chart = "mlflow";
      version = "0.14.1";
      description = "ML lifecycle management";
    };
  };

  # GitOps Charts
  gitops = {
    # FluxCD components are typically installed via flux bootstrap
    # ArgoCD
    argocd = {
      url = "https://argoproj.github.io/argo-helm";
      chart = "argo-cd";
      version = "7.7.0";
      description = "GitOps CD for Kubernetes";
    };
  };

  # Security Charts
  security = {
    vault = {
      url = "https://helm.releases.hashicorp.com";
      chart = "vault";
      version = "0.28.0";
      description = "HashiCorp Vault";
    };

    kyverno = {
      url = "https://kyverno.github.io/kyverno";
      chart = "kyverno";
      version = "3.3.0";
      description = "Kubernetes policy engine";
    };

    external-secrets = {
      url = "https://charts.external-secrets.io";
      chart = "external-secrets";
      version = "0.10.0";
      description = "External secrets operator";
    };
  };

  # Observability Charts
  observability = {
    kube-prometheus-stack = {
      url = "https://prometheus-community.github.io/helm-charts";
      chart = "kube-prometheus-stack";
      version = "65.0.0";
      description = "Prometheus, Grafana, and alerting stack";
    };

    loki = {
      url = "https://grafana.github.io/helm-charts";
      chart = "loki";
      version = "6.16.0";
      description = "Log aggregation";
    };

    tempo = {
      url = "https://grafana.github.io/helm-charts";
      chart = "tempo";
      version = "1.10.0";
      description = "Distributed tracing";
    };
  };

  # Service Mesh Charts
  service-mesh = {
    istio-base = {
      url = "https://istio-release.storage.googleapis.com/charts";
      chart = "base";
      version = "1.24.0";
      description = "Istio base components";
    };

    istiod = {
      url = "https://istio-release.storage.googleapis.com/charts";
      chart = "istiod";
      version = "1.24.0";
      description = "Istio control plane";
    };
  };

  # Backup Charts
  backup = {
    velero = {
      url = "https://vmware-tanzu.github.io/helm-charts";
      chart = "velero";
      version = "7.2.0";
      description = "Kubernetes backup and restore";
    };
  };
}
