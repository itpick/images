# clickhouse

Helm chart for **clickhouse** — ClickHouse is an open-source column-oriented OLAP database management system. Use it to boost your database performance while providing linear scalability and hardware efficiency.

[Upstream project](https://clickhouse.com)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/clickhouse
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/clickhouse --version 9.4.7
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

- [`clickhouse-keeper-nixchart`](../../images/clickhouse-keeper-nixchart/)
- [`clickhouse-nixchart`](../../images/clickhouse-nixchart/)
- [`os-shell-nixchart`](../../images/os-shell-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/clickhouse>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `9.4.7` · App version: `25.7.5`
