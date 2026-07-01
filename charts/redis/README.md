# redis

Helm chart for **redis** — Redis is an open source, advanced key-value store. It is often referred to as a data structure server since keys can contain strings, hashes, lists, sets and sorted sets.

[Upstream project](https://redis.io)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/redis
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/redis --version 23.1.1
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

- [`kubectl-nixchart`](../../images/kubectl-nixchart/)
- [`os-shell-nixchart`](../../images/os-shell-nixchart/)
- [`prometheus-redis-exporter-nixchart`](../../images/prometheus-redis-exporter-nixchart/)
- [`redis-nixchart`](../../images/redis-nixchart/)
- [`redis-sentinel-nixchart`](../../images/redis-sentinel-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/redis>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `23.1.1` · App version: `8.2.1`
