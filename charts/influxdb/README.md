# influxdb

Helm chart for **influxdb** — InfluxDB Core is an open source time-series database. It is a core component of the FDAP (Apache Flight, DataFusion, Arrow, and Parquet) stack.

[Upstream project](https://www.influxdata.com/products/influxdb/)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/influxdb
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/influxdb --version 7.1.21
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

- [`influxdb-nixchart`](../../images/influxdb-nixchart/)
- [`kubectl-nixchart`](../../images/kubectl-nixchart/)
- [`os-shell-nixchart`](../../images/os-shell-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/influxdb>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `7.1.21` · App version: `3.4.1`
