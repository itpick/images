#!/usr/bin/env bash
# Convert BigBang image list to nix image names
# Usage: ./convert-bigbang-images.sh <url-or-file> > bigbang.txt

set -euo pipefail

INPUT="${1:-}"

if [[ -z "$INPUT" ]]; then
    echo "Usage: $0 <url-or-file>" >&2
    echo "Example: $0 https://umbrella-bigbang-releases.s3-us-gov-west-1.amazonaws.com/umbrella/3.13.0/images.txt" >&2
    exit 1
fi

# Fetch content (URL or file)
if [[ "$INPUT" =~ ^https?:// ]]; then
    content=$(curl -sL "$INPUT")
else
    content=$(cat "$INPUT")
fi

# Convert registry paths to nix image names
echo "$content" | while read -r line; do
    [[ -z "$line" ]] && continue

    # Remove registry prefix and tag
    # registry1.dso.mil/ironbank/org/path/image:tag -> image
    image_with_tag="${line##*/}"        # Get last path component
    image_name="${image_with_tag%%:*}"  # Remove tag

    # Handle special cases and normalize
    case "$image_name" in
        # Map common image name patterns to our nix names
        enterprise) echo "anchore-enterprise" ;;
        enterpriseui) echo "anchore-enterpriseui" ;;
        helm-controller) echo "flux-helm-controller" ;;
        kustomize-controller) echo "flux-kustomize-controller" ;;
        notification-controller) echo "flux-notification-controller" ;;
        source-controller) echo "flux-source-controller" ;;
        eck-operator) echo "elastic-eck-operator" ;;
        elasticsearch) echo "elasticsearch" ;;
        kibana) echo "kibana" ;;
        vault-k8s) echo "vault-k8s" ;;
        vault-csi-provider) echo "vault-csi-provider" ;;
        vault) echo "vault" ;;
        prometheus-operator) echo "prometheus-operator" ;;
        prometheus-config-reloader) echo "prometheus-config-reloader" ;;
        alertmanager) echo "alertmanager" ;;
        prometheus) echo "prometheus" ;;
        node-exporter) echo "prometheus-node-exporter" ;;
        blackbox_exporter) echo "prometheus-blackbox-exporter" ;;
        memcached-exporter) echo "prometheus-memcached-exporter" ;;
        snmp_exporter) echo "prometheus-snmp-exporter" ;;
        gatekeeper) echo "opa-gatekeeper" ;;
        postgresql) echo "postgresql" ;;
        redis|redis8-slim) echo "redis" ;;
        mysql8) echo "mysql" ;;
        nginx) echo "nginx" ;;
        velero) echo "velero" ;;
        velero-plugin-for-aws) echo "velero-plugin-aws" ;;
        velero-plugin-for-csi) echo "velero-plugin-csi" ;;
        velero-plugin-for-microsoft-azure) echo "velero-plugin-azure" ;;
        gitlab-runner) echo "gitlab-runner" ;;
        gitlab-runner-helper) echo "gitlab-runner-helper" ;;
        gitaly) echo "gitlab-gitaly" ;;
        gitlab-shell) echo "gitlab-shell" ;;
        gitlab-sidekiq) echo "gitlab-sidekiq" ;;
        gitlab-webservice) echo "gitlab-webservice" ;;
        gitlab-workhorse) echo "gitlab-workhorse" ;;
        gitlab-toolbox) echo "gitlab-toolbox" ;;
        gitlab-exporter) echo "gitlab-exporter" ;;
        gitlab-mailroom) echo "gitlab-mailroom" ;;
        gitlab-pages) echo "gitlab-pages" ;;
        gitlab-container-registry) echo "gitlab-container-registry" ;;
        kubectl) echo "kubectl" ;;
        k8s-sidecar) echo "k8s-sidecar" ;;
        busybox) echo "busybox" ;;
        thanos) echo "thanos" ;;
        loki|loki-canary) echo "loki" ;;
        tempo) echo "tempo" ;;
        mimir) echo "mimir" ;;
        grafana|grafana-enterprise) echo "grafana" ;;
        keycloak) echo "keycloak" ;;
        mattermost) echo "mattermost" ;;
        harbor-core) echo "harbor-core" ;;
        trivy-adapter) echo "trivy" ;;
        kyverno) echo "kyverno" ;;
        authservice) echo "authservice" ;;
        argocd) echo "argocd" ;;
        backstage) echo "backstage" ;;
        nexus) echo "nexus" ;;
        sonarqube-community-build) echo "sonarqube" ;;
        console) echo "twistlock-console" ;;
        defender) echo "twistlock-defender" ;;
        neuvector-controller-pod) echo "neuvector-controller" ;;
        neuvector-enforcer) echo "neuvector-enforcer" ;;
        neuvector-manager-pod) echo "neuvector-manager" ;;
        neuvector-scanner-pod) echo "neuvector-scanner" ;;
        ubi9|ubi9-minimal) echo "ubi9" ;;
        yq) echo "yq" ;;
        redis-exporter) echo "prometheus-redis-exporter" ;;
        *)
            # Default: use the image name as-is, replacing underscores with hyphens
            echo "${image_name//_/-}"
            ;;
    esac
done | sort -u
