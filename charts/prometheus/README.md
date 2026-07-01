# prometheus

Helm chart for **prometheus** — Prometheus is an open source monitoring and alerting system. It enables sysadmins to monitor their infrastructures by collecting metrics from configured targets at given intervals.

[Upstream project](https://prometheus.io)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/prometheus
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/prometheus --version 2.3.0
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

- [`os-shell-nixchart`](../../images/os-shell-nixchart/)
- [`prometheus-alertmanager-nixchart`](../../images/prometheus-alertmanager-nixchart/)
- [`prometheus-nixchart`](../../images/prometheus-nixchart/)
- [`thanos-nixchart`](../../images/thanos-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/prometheus>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `2.3.0` · App version: `3.5.0`
