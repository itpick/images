# redis-cluster

Helm chart for **redis-cluster** — Redis is an open source, scalable, distributed in-memory cache for applications. It can be used to store and serve data in the form of strings, hashes, lists, sets and sorted sets.

[Upstream project](https://redis.io/topics/cluster-tutorial)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/redis-cluster
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/redis-cluster --version 13.0.5
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
- [`prometheus-redis-exporter-nixchart`](../../images/prometheus-redis-exporter-nixchart/)
- [`redis-cluster-nixchart`](../../images/redis-cluster-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/redis-cluster>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `13.0.5` · App version: `8.2.1`
