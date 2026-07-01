# elasticsearch

Helm chart for **elasticsearch** — Elasticsearch is a distributed search and analytics engine. It is used for web search, log monitoring, and real-time analytics. Ideal for Big Data applications.

[Upstream project](https://www.elastic.co/elasticsearch)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/elasticsearch
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/elasticsearch --version 22.1.7
```

## Configuration

The full list of tunables lives in [`values.yaml`](values.yaml). Most deployments
only touch a handful of values:

- `image.repository` / `image.tag` — container image (defaults to a
 `-nixchart` variant published from this repo)
- `resources` — CPU/memory requests + limits (or `resourcesPreset`)
- `persistence.enabled` — enable a PersistentVolumeClaim
- `service.type` — `ClusterIP` / `NodePort` / `LoadBalancer`
- `podSecurityContext` / `containerSecurityContext` — pod- and
 container-level security controls

## Images used

- [`elasticsearch-nixchart`](../../images/elasticsearch-nixchart/)
- [`os-shell-nixchart`](../../images/os-shell-nixchart/)
- [`prometheus-elasticsearch-exporter-nixchart`](../../images/prometheus-elasticsearch-exporter-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/elasticsearch>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `22.1.7` · App version: `9.1.2`
