# mongodb

Helm chart for **mongodb** — MongoDB is a relational open source NoSQL database. Easy to use, it stores data in JSON-like documents. Automated scalability and high-performance. Ideal for developing cloud native applications.

[Upstream project](https://www.mongodb.com)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/mongodb
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/mongodb --version 17.0.2
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
- [`mongodb-nixchart`](../../images/mongodb-nixchart/)
- [`nginx-nixchart`](../../images/nginx-nixchart/)
- [`os-shell-nixchart`](../../images/os-shell-nixchart/)
- [`prometheus-mongodb-exporter-nixchart`](../../images/prometheus-mongodb-exporter-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/mongodb>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `17.0.2` · App version: `8.0.13`
