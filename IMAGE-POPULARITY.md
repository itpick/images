# nix-containers/images — Image Popularity Ranking

_Generated 2026-06-28T04:04Z. Read-only research; no package/workflow files modified._

## Methodology & caveats

- **Total image directories** under `images/`: **3140** published images (each → `ghcr.io/nix-containers/images/<name>`).
- After folding `-fips` / `-nixchart` / `-nonroot` variants into their base software: **2243 base images** ranked here.
- **ghcr.io exposes no public pull counts**, so popularity is proxied by the *upstream* signal:
  - **Primary: Docker Hub `pull_count`** of the canonical upstream image (official `library/<name>` where it exists, else the canonical namespaced repo, e.g. `timberio/vector`, `grafana/grafana`). This is the truest 'most downloaded' signal.
  - **Secondary: GitHub stars**, taken from the *exact* `owner/repo` parsed out of each image's `default.nix`/`pkgs` `fetchFromGitHub` block (authoritative — no name-guessing).
- **Coverage:** Docker Hub pull_count obtained for **80** bases (high-value official + canonical-namespace images; Docker Hub aggressively rate-limits bulk search, so coverage is the popular core, not the full long tail). GitHub stars obtained for **540** bases.
- **Ranking rule:** images that HAVE an upstream Docker Hub pull_count are ranked first, by pulls (the literal 'most downloaded'); images without a Docker Hub repo (GHCR/Quay/gcr-only or pure GitHub-release software) are ranked beneath them by GitHub stars.
- **used_by_us (✓)** = consumed by the grown stack (postgres, rustfs, zitadel, guacamole-server; cloudnative-pg adjacent). These are pinned into Tier 1 regardless of global rank.
- **Known data artifacts:** (1) Many `kubernetes-*` component images' `fetchFromGitHub` points at the `kubernetes/kubernetes` monorepo, so they all inherit ~123k stars — directionally high-value but not literally tied. (2) Quay.io / gcr.io / GHCR-only software (keycloak, thanos, cert-manager, argo, zitadel, cloudnative-pg) has no Docker Hub number and is ranked on stars. (3) `tag_status` is read from `default.nix`: `versioned` = tag derives from `pkgs.<x>.version`/release; `latest-only` = hardcoded `latest` (no version tag yet).

## Ranked table (most → least popular)

| # | image | software / repo | dockerhub_pulls | github_stars | used | tag_status |
|---:|---|---|---:|---:|:---:|---|
| 1 | fluent-bit | fluent/fluent-bit | 15.3B |  |  | versioned |
| 2 | memcached | library/memcached | 13.2B |  |  | versioned |
| 3 | nginx | library/nginx | 13.1B |  |  | latest-only |
| 4 | busybox | library/busybox | 12.6B |  |  | versioned |
| 5 | istio-proxy | istio/proxyv2 | 12.3B |  |  | latest-only |
| 6 | alpine | library/alpine | 12B |  |  | latest-only |
| 7 | postgres | library/postgres | 10.9B | 21.3K | ✓ | latest-only |
| 8 | redis | library/redis | 10.9B |  |  | latest-only |
| 9 | python | library/python | 8.9B |  |  | latest-only |
| 10 | node | library/node | 6.6B |  |  | latest-only |
| 11 | envoy | envoyproxy/envoy | 5.7B |  |  | versioned |
| 12 | grafana | grafana/grafana | 5.3B |  |  | versioned |
| 13 | mysql | library/mysql | 5B |  |  | latest-only |
| 14 | jenkins | jenkins/jenkins | 5B |  |  | versioned |
| 15 | mongodb | library/mongo | 4.8B |  |  | versioned |
| 16 | loki | grafana/loki | 4.8B | 28.5K |  | versioned |
| 17 | httpd | library/httpd | 4.7B |  |  | latest-only |
| 18 | apache2 | library/httpd | 4.7B |  |  | versioned |
| 19 | vector | timberio/vector | 4.1B |  |  | versioned |
| 20 | node-exporter | prom/node-exporter | 3.9B |  |  | versioned |
| 21 | rabbitmq | library/rabbitmq | 3.8B |  |  | versioned |
| 22 | docker | library/docker | 3.5B |  |  | ? |
| 23 | traefik | library/traefik | 3.5B | 63.8K |  | versioned |
| 24 | mariadb | library/mariadb | 3.1B |  |  | latest-only |
| 25 | promtail | grafana/promtail | 2.6B |  |  | versioned |
| 26 | golang | library/golang | 2.6B |  |  | latest-only |
| 27 | prometheus | prom/prometheus | 2B | 64.8K |  | versioned |
| 28 | minio | minio/minio | 1.8B |  |  | latest-only |
| 29 | airflow | apache/airflow | 1.6B |  |  | versioned |
| 30 | ruby | library/ruby | 1.6B |  |  | latest-only |
| 31 | wordpress | library/wordpress | 1.5B |  |  | latest-only |
| 32 | php | library/php | 1.3B |  |  | latest-only |
| 33 | sonarqube | library/sonarqube | 1.2B |  |  | versioned |
| 34 | haproxy | library/haproxy | 1.1B |  |  | latest-only |
| 35 | influxdb | library/influxdb | 1.1B |  |  | versioned |
| 36 | consul | library/consul | 1.1B |  |  | versioned |
| 37 | elasticsearch | library/elasticsearch | 962.5M |  |  | latest-only |
| 38 | tomcat | library/tomcat | 816.6M |  |  | versioned |
| 39 | maven | library/maven | 753.3M |  |  | latest-only |
| 40 | caddy | library/caddy | 697.7M |  |  | latest-only |
| 41 | telegraf | library/telegraf | 637.1M |  |  | versioned |
| 42 | superset | apache/superset | 599.9M |  |  | versioned |
| 43 | bash | library/bash | 578.7M |  |  | latest-only |
| 44 | vault | library/vault | 552.9M | 35.8K |  | versioned |
| 45 | terraform | hashicorp/terraform | 486.3M |  |  | versioned |
| 46 | alertmanager | prom/alertmanager | 484.2M | 8.5K |  | versioned |
| 47 | gitea | gitea/gitea | 376.1M |  |  | versioned |
| 48 | mimir | grafana/mimir | 374M | 5.1K |  | versioned |
| 49 | kong | library/kong | 355.5M |  |  | versioned |
| 50 | solr | library/solr | 353.9M |  |  | versioned |
| 51 | zookeeper | library/zookeeper | 348.8M |  |  | versioned |
| 52 | alloy | grafana/alloy | 298.3M |  |  | versioned |
| 53 | gradle | library/gradle | 294.2M |  |  | latest-only |
| 54 | cassandra | library/cassandra | 257.3M |  |  | versioned |
| 55 | clickhouse | clickhouse/clickhouse-server | 252.3M |  |  | versioned |
| 56 | nats | library/nats | 239.4M |  |  | versioned |
| 57 | kibana | library/kibana | 223.4M |  |  | latest-only |
| 58 | blackbox-exporter | prom/blackbox-exporter | 205M |  |  | versioned |
| 59 | couchdb | library/couchdb | 202M |  |  | versioned |
| 60 | logstash | library/logstash | 201.6M |  |  | versioned |
| 61 | nexus | sonatype/nexus3 | 198.6M |  |  | versioned |
| 62 | valkey | valkey/valkey | 196.3M |  |  | latest-only |
| 63 | opensearch | opensearchproject/opensearch | 184.2M |  |  | versioned |
| 64 | fluentd | fluent/fluentd | 148.9M |  |  | versioned |
| 65 | argocd | argoproj/argocd | 147.6M | 23.3K |  | versioned |
| 66 | rust | library/rust | 128.2M |  |  | latest-only |
| 67 | victoria-metrics | victoriametrics/victoria-metrics | 97.3M |  |  | versioned |
| 68 | tempo | grafana/tempo | 97M | 5.3K |  | versioned |
| 69 | flink | library/flink | 96M |  |  | versioned |
| 70 | elixir | library/elixir | 66.1M |  |  | versioned |
| 71 | jetty | library/jetty | 44.5M |  |  | versioned |
| 72 | arangodb | library/arangodb | 40.2M |  |  | versioned |
| 73 | kafka | apache/kafka | 31M |  |  | versioned |
| 74 | harbor-core | goharbor/harbor-core | 27.5M | 28.8K |  | versioned |
| 75 | spark | apache/spark | 26.4M |  |  | versioned |
| 76 | nifi | apache/nifi | 24.5M |  |  | versioned |
| 77 | boundary | hashicorp/boundary | 23.9M |  |  | versioned |
| 78 | trino | trinodb/trino | 23M |  |  | latest-only |
| 79 | rustfs | rustfs/rustfs | 5.2M | 29.2K | ✓ | versioned |
| 80 | dart | library/dart | 3.8M |  |  | versioned |
| 81 | kube-apiserver | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 82 | kube-apiserver-1.34-default | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 83 | kube-apiserver-fips-1.34-default | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 84 | kube-arangodb | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 85 | kube-bench | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 86 | kube-bench-configs | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 87 | kube-conformance | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 88 | kube-downscaler | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 89 | kube-fluentd-operator | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 90 | kube-logging-operator | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 91 | kube-logging-operator-config-reloader | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 92 | kube-logging-operator-custom-runner | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 93 | kube-logging-operator-fluentd | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 94 | kube-logging-operator-fluentd-outputs | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 95 | kube-logging-operator-node-exporter | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 96 | kube-metrics-adapter | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 97 | kube-oidc-proxy | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 98 | kube-proxy | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 99 | kube-proxy-1.34-default | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 100 | kube-proxy-fips-1.34-default | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 101 | kube-rbac-proxy | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 102 | kube-scheduler | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 103 | kube-scheduler-1.34-default | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 104 | kube-scheduler-fips-1.34-default | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 105 | kube-state-metrics-nixchart | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 106 | kube-vip | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 107 | kube-vip-cloud-provider | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 108 | kube-webhook-certgen | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 109 | kubernetes-autoscaler-addon-resizer | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 110 | kubernetes-csi-driver-nfs | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 111 | kubernetes-csi-external-attacher | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 112 | kubernetes-csi-external-health-monitor | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 113 | kubernetes-csi-external-provisioner | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 114 | kubernetes-csi-external-resizer | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 115 | kubernetes-csi-external-snapshot-controller | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 116 | kubernetes-csi-external-snapshotter | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 117 | kubernetes-csi-livenessprobe | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 118 | kubernetes-csi-node-driver-registrar | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 119 | kubernetes-dashboard-api | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 120 | kubernetes-dashboard-auth | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 121 | kubernetes-dashboard-metrics-scraper | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 122 | kubernetes-dashboard-web | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 123 | kubernetes-dns-node-cache | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 124 | kubernetes-event-exporter | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 125 | kubernetes-event-exporter-nixchart | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 126 | kubernetes-ingress-defaultbackend | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 127 | kubernetes-kube-apiserver | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 128 | kubernetes-kube-controller-manager | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 129 | kubernetes-kube-proxy | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 130 | kubernetes-kube-scheduler | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 131 | kubernetes-pause | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 132 | kubernetes-reflector | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 133 | kubernetes-release-go-runner | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 134 | kubernetes-replicator | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 135 | kubernetes-secret-generator | kubernetes/kubernetes |  | 123.3K |  | versioned |
| 136 | prometheus-alertmanager-nixchart | prometheus/prometheus |  | 64.8K |  | versioned |
| 137 | prometheus-blackbox-exporter-nixchart | prometheus/prometheus |  | 64.8K |  | versioned |
| 138 | prometheus-cloudwatch-exporter | prometheus/prometheus |  | 64.8K |  | versioned |
| 139 | prometheus-elasticsearch-exporter-nixchart | prometheus/prometheus |  | 64.8K |  | versioned |
| 140 | prometheus-nixchart | prometheus/prometheus |  | 64.8K |  | versioned |
| 141 | prometheus-logstash-exporter | prometheus/prometheus |  | 64.8K |  | versioned |
| 142 | prometheus-mysqld-exporter-nixchart | prometheus/prometheus |  | 64.8K |  | versioned |
| 143 | prometheus-node-exporter-nixchart | prometheus/prometheus |  | 64.8K |  | versioned |
| 144 | prometheus-operator-nixchart | prometheus/prometheus |  | 64.8K |  | versioned |
| 145 | prometheus-pushgateway-nixchart | prometheus/prometheus |  | 64.8K |  | versioned |
| 146 | prometheus-redis-exporter-nixchart | prometheus/prometheus |  | 64.8K |  | versioned |
| 147 | prometheus-yet-another-cloudwatch-exporter | prometheus/prometheus |  | 64.8K |  | versioned |
| 148 | istio-install-cni | istio/istio |  | 38.2K |  | versioned |
| 149 | trivy | aquasecurity/trivy |  | 36.6K |  | versioned |
| 150 | harbor-exporter | goharbor/harbor |  | 28.8K |  | versioned |
| 151 | harbor-jobservice | goharbor/harbor |  | 28.8K |  | versioned |
| 152 | harbor-registryctl | goharbor/harbor |  | 28.8K |  | versioned |
| 153 | dapr-operator | dapr/dapr |  | 25.9K |  | versioned |
| 154 | rancher-hardened-kubernetes-compat | rancher/rancher |  | 25.7K |  | ? |
| 155 | cilium | cilium/cilium |  | 24.6K |  | ? |
| 156 | cilium-1.18-clustermesh-apiserver | cilium/cilium |  | 24.6K |  | versioned |
| 157 | cilium-1.18-container-init | cilium/cilium |  | 24.6K |  | versioned |
| 158 | cilium-1.18-hubble-relay | cilium/cilium |  | 24.6K |  | versioned |
| 159 | cilium-1.18-operator-aws | cilium/cilium |  | 24.6K |  | versioned |
| 160 | cilium-1.18-operator-generic | cilium/cilium |  | 24.6K |  | versioned |
| 161 | cilium-agent | cilium/cilium |  | 24.6K |  | versioned |
| 162 | cilium-certgen | cilium/cilium |  | 24.6K |  | versioned |
| 163 | cilium-clustermesh-apiserver | cilium/cilium |  | 24.6K |  | versioned |
| 164 | cilium-envoy | cilium/cilium |  | 24.6K |  | versioned |
| 165 | cilium-fips-1.18-clustermesh-apiserver | cilium/cilium |  | 24.6K |  | versioned |
| 166 | cilium-fips-1.18-container-init | cilium/cilium |  | 24.6K |  | versioned |
| 167 | cilium-fips-1.18-host-utils | cilium/cilium |  | 24.6K |  | versioned |
| 168 | cilium-fips-1.18-hubble-relay | cilium/cilium |  | 24.6K |  | versioned |
| 169 | cilium-fips-1.18-operator-generic | cilium/cilium |  | 24.6K |  | versioned |
| 170 | cilium-hubble-relay | cilium/cilium |  | 24.6K |  | versioned |
| 171 | cilium-hubble-ui | cilium/cilium |  | 24.6K |  | versioned |
| 172 | cilium-hubble-ui-backend | cilium/cilium |  | 24.6K |  | versioned |
| 173 | cilium-operator-aws | cilium/cilium |  | 24.6K |  | versioned |
| 174 | cilium-operator-generic | cilium/cilium |  | 24.6K |  | versioned |
| 175 | jaeger-2-all-in-one | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 176 | jaeger-2-anonymizer | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 177 | jaeger-2-collector | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 178 | jaeger-2-es-index-cleaner | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 179 | jaeger-2-es-rollover | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 180 | jaeger-2-fips-all-in-one | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 181 | jaeger-2-fips-anonymizer | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 182 | jaeger-2-fips-collector | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 183 | jaeger-2-fips-es-index-cleaner | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 184 | jaeger-2-fips-es-rollover | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 185 | jaeger-2-fips-ingester | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 186 | jaeger-2-fips-query | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 187 | jaeger-2-fips-remote-storage | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 188 | jaeger-2-fips-tracegen | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 189 | jaeger-2-ingester | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 190 | jaeger-2-query | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 191 | jaeger-2-remote-storage | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 192 | jaeger-2-tracegen | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 193 | jaeger-all-in-one | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 194 | jaeger-anonymizer | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 195 | jaeger-collector | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 196 | jaeger-es-index-cleaner | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 197 | jaeger-es-rollover | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 198 | jaeger-ingester | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 199 | jaeger-operator | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 200 | jaeger-query | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 201 | jaeger-remote-storage | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 202 | jaeger-tracegen | jaegertracing/jaeger |  | 22.9K |  | versioned |
| 203 | age | FiloSottile/age |  | 22.7K |  | versioned |
| 204 | ingress-nginx | kubernetes/ingress-nginx |  | 19.5K |  | versioned |
| 205 | ingress-nginx-controller | kubernetes/ingress-nginx |  | 19.5K |  | latest-only |
| 206 | argo-workflows | argoproj/argo-workflows |  | 16.8K |  | versioned |
| 207 | kubeflow-access-management | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 208 | kubeflow-admission-webhook | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 209 | kubeflow-centraldashboard | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 210 | kubeflow-jupyter-web-app | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 211 | kubeflow-katib | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 212 | kubeflow-katib-controller | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 213 | kubeflow-katib-db-manager | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 214 | kubeflow-katib-earlystopping-medianstop | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 215 | kubeflow-katib-file-metrics-collector | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 216 | kubeflow-katib-suggestion-goptuna | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 217 | kubeflow-katib-suggestion-hyperband | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 218 | kubeflow-katib-suggestion-hyperopt | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 219 | kubeflow-katib-suggestion-nas-darts | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 220 | kubeflow-katib-suggestion-optuna | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 221 | kubeflow-katib-suggestion-pbt | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 222 | kubeflow-katib-suggestion-skopt | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 223 | kubeflow-notebook-controller | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 224 | kubeflow-pipelines-api-server | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 225 | kubeflow-pipelines-apiserver | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 226 | kubeflow-pipelines-cache_server | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 227 | kubeflow-pipelines-cache-deployer | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 228 | kubeflow-pipelines-cache-server | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 229 | kubeflow-pipelines-frontend | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 230 | kubeflow-pipelines-metadata-envoy | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 231 | kubeflow-pipelines-metadata-writer | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 232 | kubeflow-pipelines-persistence_agent | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 233 | kubeflow-pipelines-persistenceagent | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 234 | kubeflow-pipelines-scheduledworkflow | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 235 | kubeflow-pipelines-viewer-crd-controller | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 236 | kubeflow-pipelines-visualization-server | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 237 | kubeflow-profile-controller | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 238 | kubeflow-pvcviewer-controller | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 239 | kubeflow-tensorboard-controller | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 240 | kubeflow-volumes-web-app | kubeflow/kubeflow |  | 15.7K |  | versioned |
| 241 | kubernetes-dashboard | kubernetes/dashboard |  | 15.4K |  | latest-only |
| 242 | oauth2-proxy | oauth2-proxy/oauth2-proxy |  | 14.6K |  | versioned |
| 243 | git-lfs | git-lfs/git-lfs |  | 14.3K |  | ? |
| 244 | zitadel | zitadel/zitadel |  | 14.2K | ✓ | versioned |
| 245 | coredns | coredns/coredns |  | 14.1K |  | versioned |
| 246 | thanos | thanos-io/thanos |  | 14.1K |  | versioned |
| 247 | cert-manager-acmesolver | cert-manager/cert-manager |  | 13.9K |  | versioned |
| 248 | cert-manager-acmesolver-nixchart | cert-manager/cert-manager |  | 13.9K |  | versioned |
| 249 | cert-manager-cainjector | cert-manager/cert-manager |  | 13.9K |  | versioned |
| 250 | cert-manager-cainjector-nixchart | cert-manager/cert-manager |  | 13.9K |  | versioned |
| 251 | cert-manager-cmctl | cert-manager/cert-manager |  | 13.9K |  | versioned |
| 252 | cert-manager-controller | cert-manager/cert-manager |  | 13.9K |  | versioned |
| 253 | cert-manager-controller-nixchart | cert-manager/cert-manager |  | 13.9K |  | versioned |
| 254 | cert-manager-csi-driver | cert-manager/cert-manager |  | 13.9K |  | versioned |
| 255 | cert-manager-istio-csr | cert-manager/cert-manager |  | 13.9K |  | versioned |
| 256 | cert-manager-startupapicheck | cert-manager/cert-manager |  | 13.9K |  | versioned |
| 257 | cert-manager-webhook | cert-manager/cert-manager |  | 13.9K |  | versioned |
| 258 | cert-manager-webhook-nixchart | cert-manager/cert-manager |  | 13.9K |  | versioned |
| 259 | cert-manager-webhook-pdns | cert-manager/cert-manager |  | 13.9K |  | versioned |
| 260 | rook-ceph-operator | rook/rook |  | 13.6K |  | versioned |
| 261 | crossplane | crossplane/crossplane |  | 11.8K |  | versioned |
| 262 | linkerd | linkerd/linkerd2 |  | 11.4K |  | versioned |
| 263 | dex | dexidp/dex |  | 10.9K |  | versioned |
| 264 | harbor-registry | distribution/distribution |  | 10.5K |  | versioned |
| 265 | keda | kedacore/keda |  | 10.3K |  | versioned |
| 266 | reloader | stakater/Reloader |  | 10.2K |  | versioned |
| 267 | stakater-reloader | stakater/Reloader |  | 10.2K |  | versioned |
| 268 | velero | vmware-tanzu/velero |  | 10.1K |  | versioned |
| 269 | prometheus-operator | prometheus-operator/prometheus-operator |  | 9.9K |  | versioned |
| 270 | sealed-secrets | bitnami-labs/sealed-secrets |  | 9.2K |  | latest-only |
| 271 | atlantis | runatlantis/atlantis |  | 9.2K |  | versioned |
| 272 | external-dns | kubernetes-sigs/external-dns |  | 9K |  | versioned |
| 273 | tekton-chains | tektoncd/pipeline |  | 9K |  | versioned |
| 274 | tekton-cli | tektoncd/pipeline |  | 9K |  | versioned |
| 275 | tekton-controller | tektoncd/pipeline |  | 9K |  | versioned |
| 276 | tekton-entrypoint | tektoncd/pipeline |  | 9K |  | versioned |
| 277 | tekton-events | tektoncd/pipeline |  | 9K |  | versioned |
| 278 | tekton-nop | tektoncd/pipeline |  | 9K |  | versioned |
| 279 | tekton-pipelines-controller | tektoncd/pipeline |  | 9K |  | versioned |
| 280 | tekton-pipelines-entrypoint | tektoncd/pipeline |  | 9K |  | ? |
| 281 | tekton-pipelines-events | tektoncd/pipeline |  | 9K |  | versioned |
| 282 | tekton-pipelines-nop | tektoncd/pipeline |  | 9K |  | versioned |
| 283 | tekton-pipelines-resolvers | tektoncd/pipeline |  | 9K |  | ? |
| 284 | tekton-pipelines-sidecarlogresults | tektoncd/pipeline |  | 9K |  | versioned |
| 285 | tekton-pipelines-webhook | tektoncd/pipeline |  | 9K |  | versioned |
| 286 | tekton-pipelines-workingdirinit | tektoncd/pipeline |  | 9K |  | versioned |
| 287 | tekton-resolvers | tektoncd/pipeline |  | 9K |  | versioned |
| 288 | tekton-sidecarlogresults | tektoncd/pipeline |  | 9K |  | versioned |
| 289 | tekton-webhook | tektoncd/pipeline |  | 9K |  | versioned |
| 290 | tekton-workingdirinit | tektoncd/pipeline |  | 9K |  | versioned |
| 291 | addon-resizer | kubernetes/autoscaler |  | 8.9K |  | versioned |
| 292 | vertical-pod-autoscaler | kubernetes/autoscaler |  | 8.9K |  | latest-only |
| 293 | cloudnative-pg | cloudnative-pg/cloudnative-pg |  | 8.9K | ✓ | versioned |
| 294 | aws-cli | aws/aws-sdk-go |  | 8.7K |  | versioned |
| 295 | aws-cli-nixchart | aws/aws-sdk-go |  | 8.7K |  | versioned |
| 296 | prometheus-alertmanager | prometheus/alertmanager |  | 8.5K |  | versioned |
| 297 | metallb | metallb/metallb |  | 8.2K |  | latest-only |
| 298 | flux-cli | fluxcd/flux2 |  | 8.2K |  | versioned |
| 299 | flux-helm-controller-nixchart | fluxcd/flux2 |  | 8.2K |  | versioned |
| 300 | flux-image-automation-controller-nixchart | fluxcd/flux2 |  | 8.2K |  | versioned |
| 301 | flux-image-reflector-controller-nixchart | fluxcd/flux2 |  | 8.2K |  | versioned |
| 302 | flux-kustomize-controller-nixchart | fluxcd/flux2 |  | 8.2K |  | versioned |
| 303 | flux-notification-controller-nixchart | fluxcd/flux2 |  | 8.2K |  | versioned |
| 304 | flux-source-controller-nixchart | fluxcd/flux2 |  | 8.2K |  | versioned |
| 305 | kyverno | kyverno/kyverno |  | 7.9K |  | versioned |
| 306 | kyverno-background-controller | kyverno/kyverno |  | 7.9K |  | versioned |
| 307 | kyverno-cleanup-controller | kyverno/kyverno |  | 7.9K |  | versioned |
| 308 | kyverno-cli | kyverno/kyverno |  | 7.9K |  | versioned |
| 309 | kyverno-init-container | kyverno/kyverno |  | 7.9K |  | ? |
| 310 | kyverno-notation-aws | kyverno/kyverno |  | 7.9K |  | versioned |
| 311 | kyverno-policy-reporter | kyverno/kyverno |  | 7.9K |  | versioned |
| 312 | kyverno-policy-reporter-kyverno-plugin | kyverno/kyverno |  | 7.9K |  | versioned |
| 313 | kyverno-policy-reporter-plugin | kyverno/kyverno |  | 7.9K |  | versioned |
| 314 | kyverno-policy-reporter-plugin-kyverno | kyverno/kyverno |  | 7.9K |  | versioned |
| 315 | kyverno-policy-reporter-plugin-trivy | kyverno/kyverno |  | 7.9K |  | versioned |
| 316 | kyverno-policy-reporter-plugins-kyverno | kyverno/kyverno |  | 7.9K |  | versioned |
| 317 | kyverno-policy-reporter-plugins-trivy | kyverno/kyverno |  | 7.9K |  | versioned |
| 318 | kyverno-policy-reporter-ui | kyverno/kyverno |  | 7.9K |  | versioned |
| 319 | kyverno-pre | kyverno/kyverno |  | 7.9K |  | ? |
| 320 | kyverno-reports-controller | kyverno/kyverno |  | 7.9K |  | versioned |
| 321 | kyvernopre | kyverno/kyverno |  | 7.9K |  | versioned |
| 322 | karpenter | aws/karpenter-provider-aws |  | 7.7K |  | latest-only |
| 323 | calico-apiserver | projectcalico/calico |  | 7.3K |  | versioned |
| 324 | calico-calicoctl | projectcalico/calico |  | 7.3K |  | versioned |
| 325 | calico-cni | projectcalico/calico |  | 7.3K |  | versioned |
| 326 | calico-csi | projectcalico/calico |  | 7.3K |  | versioned |
| 327 | calico-goldmane | projectcalico/calico |  | 7.3K |  | versioned |
| 328 | calico-key-cert-provisioner | projectcalico/calico |  | 7.3K |  | versioned |
| 329 | calico-kube-controllers | projectcalico/calico |  | 7.3K |  | versioned |
| 330 | calico-node | projectcalico/calico |  | 7.3K |  | versioned |
| 331 | calico-node-driver-registrar | projectcalico/calico |  | 7.3K |  | versioned |
| 332 | calico-pod2daemon | projectcalico/calico |  | 7.3K |  | ? |
| 333 | calico-pod2daemon-flexvol | projectcalico/calico |  | 7.3K |  | versioned |
| 334 | calico-typha | projectcalico/calico |  | 7.3K |  | versioned |
| 335 | calico-typhad | projectcalico/calico |  | 7.3K |  | versioned |
| 336 | calico-whisker | projectcalico/calico |  | 7.3K |  | versioned |
| 337 | calico-whisker-backend | projectcalico/calico |  | 7.3K |  | versioned |
| 338 | flux | fluxcd/flux |  | 6.9K |  | versioned |
| 339 | headlamp | kubernetes-sigs/headlamp |  | 6.8K |  | versioned |
| 340 | external-secrets | external-secrets/external-secrets |  | 6.7K |  | versioned |
| 341 | metrics-server | kubernetes-sigs/metrics-server |  | 6.7K |  | versioned |
| 342 | actions-runner-controller | actions/actions-runner-controller |  | 6.3K |  | versioned |
| 343 | kube-state-metrics | kubernetes/kube-state-metrics |  | 6.1K |  | versioned |
| 344 | sigstore-policy-controller | sigstore/cosign |  | 6.1K |  | versioned |
| 345 | sigstore-scaffolding-cloudsqlproxy | sigstore/cosign |  | 6.1K |  | versioned |
| 346 | sigstore-scaffolding-ctlog-createctconfig | sigstore/cosign |  | 6.1K |  | versioned |
| 347 | sigstore-scaffolding-ctlog-managectroots | sigstore/cosign |  | 6.1K |  | versioned |
| 348 | sigstore-scaffolding-ctlog-verifyfulcio | sigstore/cosign |  | 6.1K |  | versioned |
| 349 | sigstore-scaffolding-fips-cloudsqlproxy | sigstore/cosign |  | 6.1K |  | versioned |
| 350 | sigstore-scaffolding-fips-ctlog-verifyfulcio | sigstore/cosign |  | 6.1K |  | versioned |
| 351 | sigstore-scaffolding-fips-fulcio-createcerts | sigstore/cosign |  | 6.1K |  | versioned |
| 352 | sigstore-scaffolding-fips-getoidctoken | sigstore/cosign |  | 6.1K |  | versioned |
| 353 | sigstore-scaffolding-fips-rekor-createsecret | sigstore/cosign |  | 6.1K |  | versioned |
| 354 | sigstore-scaffolding-fips-trillian-createdb | sigstore/cosign |  | 6.1K |  | versioned |
| 355 | sigstore-scaffolding-fips-trillian-createtree | sigstore/cosign |  | 6.1K |  | versioned |
| 356 | sigstore-scaffolding-fips-trillian-updatetree | sigstore/cosign |  | 6.1K |  | versioned |
| 357 | sigstore-scaffolding-fips-tsa-createcertchain | sigstore/cosign |  | 6.1K |  | versioned |
| 358 | sigstore-scaffolding-fips-tuf-createsecret | sigstore/cosign |  | 6.1K |  | versioned |
| 359 | sigstore-scaffolding-fulcio-createcerts | sigstore/cosign |  | 6.1K |  | versioned |
| 360 | sigstore-scaffolding-getoidctoken | sigstore/cosign |  | 6.1K |  | versioned |
| 361 | sigstore-scaffolding-rekor-createsecret | sigstore/cosign |  | 6.1K |  | versioned |
| 362 | sigstore-scaffolding-trillian-createdb | sigstore/cosign |  | 6.1K |  | versioned |
| 363 | sigstore-scaffolding-trillian-createtree | sigstore/cosign |  | 6.1K |  | versioned |
| 364 | sigstore-scaffolding-trillian-updatetree | sigstore/cosign |  | 6.1K |  | versioned |
| 365 | sigstore-scaffolding-tsa-createcertchain | sigstore/cosign |  | 6.1K |  | versioned |
| 366 | sigstore-scaffolding-tuf-createsecret | sigstore/cosign |  | 6.1K |  | versioned |
| 367 | sigstore-scaffolding-tuf-server | sigstore/cosign |  | 6.1K |  | versioned |
| 368 | knative-eventing-1.19-channel-controller | knative/serving |  | 6.1K |  | versioned |
| 369 | knative-eventing-1.19-channel-dispatcher | knative/serving |  | 6.1K |  | versioned |
| 370 | knative-eventing-1.19-controller | knative/serving |  | 6.1K |  | versioned |
| 371 | knative-eventing-1.19-filter | knative/serving |  | 6.1K |  | versioned |
| 372 | knative-eventing-1.19-ingress | knative/serving |  | 6.1K |  | versioned |
| 373 | knative-eventing-1.19-jobsink | knative/serving |  | 6.1K |  | versioned |
| 374 | knative-eventing-1.19-mtchannel-broker | knative/serving |  | 6.1K |  | versioned |
| 375 | knative-eventing-1.19-webhook | knative/serving |  | 6.1K |  | versioned |
| 376 | knative-eventing-channel-controller | knative/serving |  | 6.1K |  | versioned |
| 377 | knative-eventing-channel-dispatcher | knative/serving |  | 6.1K |  | versioned |
| 378 | knative-eventing-controller | knative/serving |  | 6.1K |  | versioned |
| 379 | knative-eventing-filter | knative/serving |  | 6.1K |  | versioned |
| 380 | knative-eventing-fips-1.19-channel-controller | knative/serving |  | 6.1K |  | versioned |
| 381 | knative-eventing-fips-1.19-channel-dispatcher | knative/serving |  | 6.1K |  | versioned |
| 382 | knative-eventing-fips-1.19-controller | knative/serving |  | 6.1K |  | versioned |
| 383 | knative-eventing-fips-1.19-filter | knative/serving |  | 6.1K |  | versioned |
| 384 | knative-eventing-fips-1.19-ingress | knative/serving |  | 6.1K |  | versioned |
| 385 | knative-eventing-fips-1.19-jobsink | knative/serving |  | 6.1K |  | versioned |
| 386 | knative-eventing-fips-1.19-mtchannel-broker | knative/serving |  | 6.1K |  | versioned |
| 387 | knative-eventing-fips-1.19-webhook | knative/serving |  | 6.1K |  | versioned |
| 388 | knative-eventing-ingress | knative/serving |  | 6.1K |  | versioned |
| 389 | knative-eventing-jobsink | knative/serving |  | 6.1K |  | versioned |
| 390 | knative-eventing-mtchannel-broker | knative/serving |  | 6.1K |  | versioned |
| 391 | knative-eventing-webhook | knative/serving |  | 6.1K |  | versioned |
| 392 | knative-operator | knative/serving |  | 6.1K |  | versioned |
| 393 | knative-operator-1.19-webhook | knative/serving |  | 6.1K |  | versioned |
| 394 | knative-operator-webhook | knative/serving |  | 6.1K |  | versioned |
| 395 | knative-serving | knative/serving |  | 6.1K |  | versioned |
| 396 | knative-serving-1.19-activator | knative/serving |  | 6.1K |  | versioned |
| 397 | knative-serving-1.19-autoscaler | knative/serving |  | 6.1K |  | versioned |
| 398 | knative-serving-1.19-controller | knative/serving |  | 6.1K |  | versioned |
| 399 | knative-serving-1.19-queue | knative/serving |  | 6.1K |  | versioned |
| 400 | knative-serving-1.19-webhook | knative/serving |  | 6.1K |  | versioned |
| 401 | knative-serving-activator | knative/serving |  | 6.1K |  | versioned |
| 402 | knative-serving-autoscaler | knative/serving |  | 6.1K |  | versioned |
| 403 | knative-serving-controller | knative/serving |  | 6.1K |  | versioned |
| 404 | knative-serving-queue | knative/serving |  | 6.1K |  | versioned |
| 405 | knative-serving-webhook | knative/serving |  | 6.1K |  | versioned |
| 406 | openfga | openfga/openfga |  | 5.4K |  | versioned |
| 407 | aws-load-balancer-controller | kubernetes-sigs/aws-load-balancer-controller |  | 4.3K |  | versioned |
| 408 | cluster-api-1.9-controller | kubernetes-sigs/cluster-api |  | 4.2K |  | versioned |
| 409 | cluster-api-1.9-kubeadm-control-plane-controller | kubernetes-sigs/cluster-api |  | 4.2K |  | versioned |
| 410 | cluster-api-aws-controller | kubernetes-sigs/cluster-api |  | 4.2K |  | versioned |
| 411 | cluster-api-azure-controller | kubernetes-sigs/cluster-api |  | 4.2K |  | versioned |
| 412 | cluster-api-capd-manager | kubernetes-sigs/cluster-api |  | 4.2K |  | versioned |
| 413 | cluster-api-clusterctl | kubernetes-sigs/cluster-api |  | 4.2K |  | versioned |
| 414 | cluster-api-controller | kubernetes-sigs/cluster-api |  | 4.2K |  | versioned |
| 415 | cluster-api-fips-1.9-clusterctl | kubernetes-sigs/cluster-api |  | 4.2K |  | versioned |
| 416 | cluster-api-fips-1.9-controller | kubernetes-sigs/cluster-api |  | 4.2K |  | versioned |
| 417 | cluster-api-fips-1.9-kubeadm-bootstrap-controller | kubernetes-sigs/cluster-api |  | 4.2K |  | versioned |
| 418 | cluster-api-fips-1.9-kubeadm-control-plane-controller | kubernetes-sigs/cluster-api |  | 4.2K |  | versioned |
| 419 | cluster-api-gcp-controller | kubernetes-sigs/cluster-api |  | 4.2K |  | versioned |
| 420 | cluster-api-helm-controller | kubernetes-sigs/cluster-api |  | 4.2K |  | versioned |
| 421 | cluster-api-ipam-provider-in-cluster | kubernetes-sigs/cluster-api |  | 4.2K |  | versioned |
| 422 | cluster-api-kubeadm-bootstrap-controller | kubernetes-sigs/cluster-api |  | 4.2K |  | versioned |
| 423 | cluster-api-kubeadm-control-plane-controller | kubernetes-sigs/cluster-api |  | 4.2K |  | versioned |
| 424 | cluster-api-provider-vsphere | kubernetes-sigs/cluster-api |  | 4.2K |  | versioned |
| 425 | cluster-api-vsphere-controller | kubernetes-sigs/cluster-api |  | 4.2K |  | versioned |
| 426 | cluster-autoscaler | kubernetes-sigs/cluster-api |  | 4.2K |  | latest-only |
| 427 | cluster-proportional-autoscaler | kubernetes-sigs/cluster-api |  | 4.2K |  | latest-only |
| 428 | kubeflow-pipelines | kubeflow/pipelines |  | 4.2K |  | versioned |
| 429 | contour | projectcontour/contour |  | 3.9K |  | versioned |
| 430 | guacamole-server | apache/guacamole-server |  | 3.9K | ✓ | latest-only |
| 431 | spegel | spegel-org/spegel |  | 3.7K |  | versioned |
| 432 | kiali | kiali/kiali |  | 3.6K |  | versioned |
| 433 | argo-rollouts | argoproj/argo-rollouts |  | 3.5K |  | versioned |
| 434 | prometheus-pushgateway | prometheus/pushgateway |  | 3.3K |  | versioned |
| 435 | spark-operator | kubeflow/spark-operator |  | 3.1K |  | versioned |
| 436 | eck-operator | elastic/cloud-on-k8s |  | 2.8K |  | versioned |
| 437 | envoy-gateway | envoyproxy/gateway |  | 2.8K |  | versioned |
| 438 | git-sync | kubernetes/git-sync |  | 2.7K |  | versioned |
| 439 | argo-events | argoproj/argo-events |  | 2.7K |  | versioned |
| 440 | amazon-vpc-cni | aws/amazon-vpc-cni-k8s |  | 2.4K |  | versioned |
| 441 | spire | spiffe/spire |  | 2.4K |  | versioned |
| 442 | bank-vaults | bank-vaults/bank-vaults |  | 2.3K |  | latest-only |
| 443 | kubeflow-trainer | kubeflow/training-operator |  | 2.1K |  | versioned |
| 444 | trainer-controller-manager | kubeflow/trainer |  | 2.1K |  | versioned |
| 445 | aws-node-termination-handler | aws/aws-node-termination-handler |  | 1.8K |  | latest-only |
| 446 | grafana-agent-operator | grafana/agent |  | 1.7K |  | versioned |
| 447 | rancher-fleet | rancher/fleet |  | 1.7K |  | versioned |
| 448 | argocd-image-updater | argoproj-labs/argocd-image-updater |  | 1.7K |  | versioned |
| 449 | katib-controller | kubeflow/katib |  | 1.7K |  | versioned |
| 450 | katib-db-manager | kubeflow/katib |  | 1.7K |  | versioned |
| 451 | katib-ui | kubeflow/katib |  | 1.7K |  | versioned |
| 452 | reflector | emberstack/kubernetes-reflector |  | 1.6K |  | versioned |
| 453 | minio-operator | minio/operator |  | 1.4K |  | versioned |
| 454 | minio-operator-sidecar | minio/operator |  | 1.4K |  | versioned |
| 455 | grafana-operator | grafana/grafana-operator |  | 1.3K |  | versioned |
| 456 | neuvector-controller | neuvector/neuvector |  | 1.3K |  | versioned |
| 457 | neuvector-enforcer | neuvector/neuvector |  | 1.3K |  | versioned |
| 458 | csi-driver-nfs | kubernetes-csi/csi-driver-nfs |  | 1.3K |  | latest-only |
| 459 | sig-storage-local-static-provisioner | kubernetes-sigs/sig-storage-local-static-provisioner |  | 1.2K |  | latest-only |
| 460 | aws-ebs-csi-driver | kubernetes-sigs/aws-ebs-csi-driver |  | 1.1K |  | versioned |
| 461 | configmap-reload | jimmidyson/configmap-reload |  | 1.1K |  | versioned |
| 462 | node-feature-discovery | kubernetes-sigs/node-feature-discovery |  | 1.1K |  | latest-only |
| 463 | k8s-dns-node-cache | kubernetes/dns |  | 1K |  | versioned |
| 464 | node-local-dns | kubernetes/dns |  | 1K |  | versioned |
| 465 | rancher-system-upgrade-controller | rancher/system-upgrade-controller |  | 955 |  | versioned |
| 466 | vault-k8s | hashicorp/vault-k8s |  | 839 |  | versioned |
| 467 | aws-efs-csi-driver | kubernetes-sigs/aws-efs-csi-driver |  | 800 |  | versioned |
| 468 | k8s-sidecar | kiwigrid/k8s-sidecar |  | 768 |  | versioned |
| 469 | aws-otel-collector | aws-observability/aws-otel-collector |  | 750 |  | versioned |
| 470 | aws-otel-collector-healthcheck | aws-observability/aws-otel-collector |  | 750 |  | versioned |
| 471 | csi-driver-smb | kubernetes-csi/csi-driver-smb |  | 649 |  | latest-only |
| 472 | csi-snapshotter | kubernetes-csi/external-snapshotter |  | 637 |  | versioned |
| 473 | snapshot-controller | kubernetes-csi/external-snapshotter |  | 637 |  | versioned |
| 474 | snapshot-validation-webhook | kubernetes-csi/external-snapshotter |  | 637 |  | versioned |
| 475 | rancher-ui | rancher/ui |  | 624 |  | versioned |
| 476 | rancher-dashboard | rancher/dashboard |  | 597 |  | versioned |
| 477 | aws-for-fluent-bit | aws/aws-for-fluent-bit |  | 523 |  | versioned |
| 478 | hubble-ui | cilium/hubble-ui |  | 520 |  | versioned |
| 479 | grafana-image-renderer | grafana/grafana-image-renderer |  | 516 |  | versioned |
| 480 | flux-helm-controller | fluxcd/helm-controller |  | 513 |  | versioned |
| 481 | helm-controller | fluxcd/helm-controller |  | 513 |  | versioned |
| 482 | crossplane-aws | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 483 | crossplane-aws-cloudfront | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 484 | crossplane-aws-cloudwatchlogs | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 485 | crossplane-aws-dynamodb | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 486 | crossplane-aws-ec2 | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 487 | crossplane-aws-eks | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 488 | crossplane-aws-firehose | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 489 | crossplane-aws-iam | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 490 | crossplane-aws-kinesis | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 491 | crossplane-aws-kms | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 492 | crossplane-aws-lambda | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 493 | crossplane-aws-provider | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 494 | crossplane-aws-rds | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 495 | crossplane-aws-route53 | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 496 | crossplane-aws-s3 | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 497 | crossplane-aws-sns | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 498 | crossplane-aws-sqs | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 499 | crossplane-azure | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 500 | crossplane-azure-authorization | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 501 | crossplane-azure-managedidentity | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 502 | crossplane-azure-sql | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 503 | crossplane-azure-storage | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 504 | crossplane-function-environment-configs | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 505 | crossplane-function-go-templating | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 506 | crossplane-gcp-cloudplatform | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 507 | crossplane-gcp-compute | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 508 | crossplane-gcp-container | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 509 | crossplane-gcp-dns | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 510 | crossplane-gcp-kms | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 511 | crossplane-gcp-provider-family | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 512 | crossplane-gcp-pubsub | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 513 | crossplane-gcp-storage | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 514 | crossplane-keycloak | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 515 | crossplane-provider-aws | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 516 | crossplane-sql | crossplane-contrib/provider-aws |  | 490 |  | versioned |
| 517 | aws-sigv4-proxy | awslabs/aws-sigv4-proxy |  | 450 |  | versioned |
| 518 | bitwarden-sdk-server | bitwarden/sdk |  | 441 |  | versioned |
| 519 | csi-provisioner | kubernetes-csi/external-provisioner |  | 414 |  | versioned |
| 520 | trust-manager | cert-manager/trust-manager |  | 382 |  | versioned |
| 521 | policy-reporter | kyverno/policy-reporter |  | 374 |  | versioned |
| 522 | vault-csi-provider | hashicorp/vault-csi-provider |  | 348 |  | versioned |
| 523 | dragonfly-operator | dragonflydb/dragonfly-operator |  | 337 |  | versioned |
| 524 | jobset | kubernetes-sigs/jobset |  | 329 |  | versioned |
| 525 | pulumi-kubernetes-operator | pulumi/pulumi-kubernetes-operator |  | 291 |  | versioned |
| 526 | flux-kustomize-controller | fluxcd/kustomize-controller |  | 285 |  | versioned |
| 527 | kustomize-controller | fluxcd/kustomize-controller |  | 285 |  | versioned |
| 528 | flux-source-controller | fluxcd/source-controller |  | 280 |  | versioned |
| 529 | source-controller | fluxcd/source-controller |  | 280 |  | versioned |
| 530 | velero-plugin-aws | vmware-tanzu/velero-plugin-for-aws |  | 279 |  | versioned |
| 531 | aws-application-networking-k8s | aws/aws-application-networking-k8s |  | 272 |  | versioned |
| 532 | aws-gateway-controller | aws/aws-application-networking-k8s |  | 272 |  | versioned |
| 533 | aws-privateca-issuer | cert-manager/aws-privateca-issuer |  | 242 |  | versioned |
| 534 | authservice | istio-ecosystem/authservice |  | 240 |  | versioned |
| 535 | trivy-adapter | aquasecurity/harbor-scanner-trivy |  | 226 |  | versioned |
| 536 | flux-image-automation-controller | fluxcd/image-automation-controller |  | 204 |  | versioned |
| 537 | image-automation-controller | fluxcd/image-automation-controller |  | 204 |  | versioned |
| 538 | crossplane-provider-kubernetes | crossplane-contrib/provider-kubernetes |  | 194 |  | versioned |
| 539 | csi-attacher | kubernetes-csi/external-attacher |  | 190 |  | versioned |
| 540 | rollout-operator | grafana/rollout-operator |  | 187 |  | versioned |
| 541 | flux-notification-controller | fluxcd/notification-controller |  | 178 |  | versioned |
| 542 | notification-controller | fluxcd/notification-controller |  | 178 |  | versioned |
| 543 | csi-node-driver-registrar | kubernetes-csi/node-driver-registrar |  | 165 |  | versioned |
| 544 | crossplane-provider-sql | crossplane-contrib/provider-sql |  | 153 |  | versioned |
| 545 | csi-resizer | kubernetes-csi/external-resizer |  | 146 |  | versioned |
| 546 | mattermost-operator | mattermost/mattermost-operator |  | 141 |  | versioned |
| 547 | rancher-machine | rancher/machine |  | 133 |  | versioned |
| 548 | crossplane-provider-gcp | crossplane-contrib/provider-gcp |  | 128 |  | versioned |
| 549 | flux-image-reflector-controller | fluxcd/image-reflector-controller |  | 121 |  | versioned |
| 550 | image-reflector-controller | fluxcd/image-reflector-controller |  | 121 |  | versioned |
| 551 | velero-plugin-csi | vmware-tanzu/velero-plugin-for-csi |  | 120 |  | versioned |
| 552 | crossplane-provider-terraform | crossplane-contrib/provider-terraform |  | 118 |  | versioned |
| 553 | velero-plugin-azure | vmware-tanzu/velero-plugin-for-microsoft-azure |  | 114 |  | versioned |
| 554 | livenessprobe | kubernetes-csi/livenessprobe |  | 100 |  | latest-only |
| 555 | aws-eks-pod-identity-agent | aws/eks-pod-identity-agent |  | 94 |  | versioned |
| 556 | crossplane-provider-azure | crossplane-contrib/provider-azure |  | 94 |  | versioned |
| 557 | kiali-operator | kiali/kiali-operator |  | 90 |  | versioned |
| 558 | velero-plugin-for-gcp | vmware-tanzu/velero-plugin-for-gcp |  | 85 |  | versioned |
| 559 | crossplane-provider-gitlab | crossplane-contrib/provider-gitlab |  | 82 |  | versioned |
| 560 | aws-network-policy-agent | aws/aws-network-policy-agent |  | 74 |  | versioned |
| 561 | flux-source-watcher | fluxcd/source-watcher |  | 72 |  | versioned |
| 562 | aws-s3-controller | aws-controllers-k8s/s3-controller |  | 71 |  | versioned |
| 563 | rancher-kontainer-driver-metadata | rancher/kontainer-driver-metadata |  | 65 |  | versioned |
| 564 | crossplane-provider-keycloak | crossplane-contrib/provider-keycloak |  | 64 |  | versioned |
| 565 | rancher-agent | rancher/agent |  | 60 |  | versioned |
| 566 | policy-reporter-ui | kyverno/policy-reporter-ui |  | 59 |  | versioned |
| 567 | alloy-operator | grafana/alloy-operator |  | 57 |  | versioned |
| 568 | newrelic-infrastructure-k8s | newrelic/nri-kubernetes |  | 48 |  | versioned |
| 569 | newrelic-k8s-events-forwarder | newrelic/nri-kubernetes |  | 48 |  | versioned |
| 570 | newrelic-kube-events | newrelic/nri-kubernetes |  | 48 |  | versioned |
| 571 | newrelic-kubernetes | newrelic/nri-kubernetes |  | 48 |  | versioned |
| 572 | newrelic-prometheus | newrelic/nri-kubernetes |  | 48 |  | versioned |
| 573 | nri-kubernetes | newrelic/nri-kubernetes |  | 48 |  | versioned |
| 574 | rancher-security-scan | rancher/security-scan |  | 44 |  | versioned |
| 575 | argocd-extension-installer | argoproj-labs/argocd-extension-installer |  | 41 |  | versioned |
| 576 | nri-prometheus | newrelic/nri-prometheus |  | 41 |  | versioned |
| 577 | crossplane-function-auto-ready | crossplane-contrib/function-auto-ready |  | 34 |  | versioned |
| 578 | harbor-scanner-trivy | goharbor/harbor-scanner-trivy |  | 33 |  | versioned |
| 579 | harbor-trivy-adapter | goharbor/harbor-scanner-trivy |  | 33 |  | versioned |
| 580 | rancher-api-ui | rancher/api-ui |  | 32 |  | versioned |
| 581 | rancher-webhook | rancher/webhook |  | 29 |  | versioned |
| 582 | nri-postgresql | newrelic/nri-postgresql |  | 27 |  | versioned |
| 583 | neuvector-scanner | neuvector/scanner |  | 23 |  | versioned |
| 584 | nri-nginx | newrelic/nri-nginx |  | 23 |  | versioned |
| 585 | aws-signer-notation-plugin | aws/aws-signer-notation-plugin |  | 17 |  | versioned |
| 586 | nri-kafka | newrelic/nri-kafka |  | 16 |  | versioned |
| 587 | kyverno-plugin | kyverno/policy-reporter-kyverno-plugin |  | 15 |  | versioned |
| 588 | nri-redis | newrelic/nri-redis |  | 15 |  | versioned |
| 589 | rancher-helm | rancher/helm |  | 15 |  | versioned |
| 590 | rancher-shell | rancher/shell |  | 14 |  | versioned |
| 591 | nri-mysql | newrelic/nri-mysql |  | 13 |  | versioned |
| 592 | aws-volume-modifier-for-k8s | awslabs/volume-modifier-for-k8s |  | 12 |  | versioned |
| 593 | nri-elasticsearch | newrelic/nri-elasticsearch |  | 11 |  | versioned |
| 594 | nri-mssql | newrelic/nri-mssql |  | 10 |  | versioned |
| 595 | nri-rabbitmq | newrelic/nri-rabbitmq |  | 9 |  | versioned |
| 596 | nri-discovery-kubernetes | newrelic/nri-discovery-kubernetes |  | 8 |  | versioned |
| 597 | rancher-telemetry | rancher/telemetry |  | 8 |  | versioned |
| 598 | nri-cassandra | newrelic/nri-cassandra |  | 6 |  | versioned |
| 599 | nri-jmx | newrelic/nri-jmx |  | 6 |  | versioned |
| 600 | nri-mongodb | newrelic/nri-mongodb |  | 6 |  | versioned |
| 601 | nri-couchbase | newrelic/nri-couchbase |  | 3 |  | versioned |
| 602 | nri-nagios | newrelic/nri-nagios |  | 3 |  | versioned |
| 603 | nri-apache | newrelic/nri-apache |  | 2 |  | versioned |
| 604 | nri-f5 | newrelic/nri-f5 |  | 2 |  | versioned |
| 605 | rancher-loglevel | rancher/loglevel |  | 2 |  | versioned |
| 606 | nri-haproxy | newrelic/nri-haproxy |  | 1 |  | versioned |
| 607 | neuvector-registry-adapter | neuvector/registry-adapter |  | 0 |  | versioned |
| 608 | nri-consul | newrelic/nri-consul |  | 0 |  | versioned |
| 609 | nri-memcached | newrelic/nri-memcached |  | 0 |  | versioned |

### Unclassified long tail (1634 images)
No Docker Hub repo and no GitHub repo extractable from `default.nix` (mostly nixpkgs-attr leaf packages, AWS/cloud agent sub-components, language toolchain split images, and base/runtime layers). These form the bottom of Tier 3.

Sample: act, actionlint, actions-runner, adoptium-jdk, adoptium-jre, adoptium-openjdk, adoptium-openjdk-21-default-jdk, adoptium-openjdk-21-default-jvm, adoptium-openjdk-21-jre, adoptium-openjdk-21-jre-base, adoptium-openjdk-25-default-jdk, adoptium-openjdk-25-default-jvm, adoptium-openjdk-25-jre, adoptium-openjdk-25-jre-base, adoptium-openjdk-bcfips-policy-140-3-j21, agentbeat, airflow-core, akhq, alibi-detect, amazon-cloudwatch-agent, amazon-cloudwatch-agent-amazon-cloudwatch-agent-config-wizard, amazon-cloudwatch-agent-config-downloader, amazon-cloudwatch-agent-config-translator, amazon-cloudwatch-agent-operator, amazon-cloudwatch-agent-start-amazon-cloudwatch-agent, amazon-corretto-jdk, amazon-corretto-jre, amazon-k8s-cni, amazon-k8s-cni-init, anchore-enterprise, anchore-enterpriseui, ant, apache-activemq-artemis, apache-apisix, apache-arrow, apache-beam-python-sdk, apache-exporter, apache-hop, apache-kvrocks, apache-nifi…

## Priority tiers

**Tier 1 — top global + used-by-us (focus here first):**

- postgres — library/postgres — pulls 10.9B, stars 21.3K, tag:latest-only **(USED BY US)**
- rustfs — rustfs/rustfs — pulls 5.2M, stars 29.2K, tag:versioned **(USED BY US)**
- zitadel — zitadel/zitadel — pulls n/a, stars 14.2K, tag:versioned **(USED BY US)**
- cloudnative-pg — cloudnative-pg/cloudnative-pg — pulls n/a, stars 8.9K, tag:versioned **(USED BY US)**
- guacamole-server — apache/guacamole-server — pulls n/a, stars 3.9K, tag:latest-only **(USED BY US)**
- fluent-bit — fluent/fluent-bit — pulls 15.3B, stars n/a, tag:versioned
- memcached — library/memcached — pulls 13.2B, stars n/a, tag:versioned
- nginx — library/nginx — pulls 13.1B, stars n/a, tag:latest-only
- busybox — library/busybox — pulls 12.6B, stars n/a, tag:versioned
- istio-proxy — istio/proxyv2 — pulls 12.3B, stars n/a, tag:latest-only
- alpine — library/alpine — pulls 12B, stars n/a, tag:latest-only
- redis — library/redis — pulls 10.9B, stars n/a, tag:latest-only
- python — library/python — pulls 8.9B, stars n/a, tag:latest-only
- node — library/node — pulls 6.6B, stars n/a, tag:latest-only
- envoy — envoyproxy/envoy — pulls 5.7B, stars n/a, tag:versioned
- grafana — grafana/grafana — pulls 5.3B, stars n/a, tag:versioned
- mysql — library/mysql — pulls 5B, stars n/a, tag:latest-only
- jenkins — jenkins/jenkins — pulls 5B, stars n/a, tag:versioned
- mongodb — library/mongo — pulls 4.8B, stars n/a, tag:versioned
- loki — grafana/loki — pulls 4.8B, stars 28.5K, tag:versioned
- httpd — library/httpd — pulls 4.7B, stars n/a, tag:latest-only
- apache2 — library/httpd — pulls 4.7B, stars n/a, tag:versioned
- vector — timberio/vector — pulls 4.1B, stars n/a, tag:versioned
- node-exporter — prom/node-exporter — pulls 3.9B, stars n/a, tag:versioned

**Tier 2 — ranks ~21–80 (popular core, mostly DH-backed):**

rabbitmq, docker, traefik, mariadb, promtail, golang, prometheus, minio, airflow, ruby, wordpress, php, sonarqube, haproxy, influxdb, consul, elasticsearch, tomcat, maven, caddy, telegraf, superset, bash, vault, terraform, alertmanager, gitea, mimir, kong, solr, zookeeper, alloy, gradle, cassandra, clickhouse, nats, kibana, blackbox-exporter, couchdb, logstash, nexus, valkey, opensearch, fluentd, argocd, rust, victoria-metrics, tempo, flink, elixir, jetty, arangodb, kafka, harbor-core, spark, nifi, boundary, trino, rustfs, dart

**Tier 3 — long tail (ranks 80+ and the unclassified set):** everything below; prioritize within it by GitHub stars and whether a build/kind-test is currently red.

## Recommended focus order (global popularity + used-by-us)

1. postgres  (used-by-us)
2. zitadel  (used-by-us)
3. cloudnative-pg  (used-by-us)
4. rustfs  (used-by-us)
5. guacamole-server  (used-by-us)
6. fluent-bit
7. memcached
8. nginx
9. busybox
10. istio-proxy
11. alpine
12. redis
13. python
14. node
15. envoy
16. grafana
17. mysql
18. jenkins
19. mongodb
