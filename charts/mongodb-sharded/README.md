# mongodb-sharded

Helm chart for **mongodb-sharded** — MongoDB is an open source NoSQL database that uses JSON for data storage. MongoDB Sharded improves scalability and reliability for large datasets by distributing data across multiple machines.

[Upstream project](https://www.mongodb.com)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/mongodb-sharded
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/mongodb-sharded --version 9.4.14
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

- [`mongodb-sharded-nixchart`](../../images/mongodb-sharded-nixchart/)
- [`os-shell-nixchart`](../../images/os-shell-nixchart/)
- [`prometheus-mongodb-exporter-nixchart`](../../images/prometheus-mongodb-exporter-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/mongodb-sharded>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `9.4.14` · App version: `8.0.13`
