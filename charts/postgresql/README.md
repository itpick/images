# postgresql

Helm chart for **postgresql** — PostgreSQL (Postgres) is an open source object-relational database known for reliability and data integrity. ACID-compliant, it supports foreign keys, joins, views, triggers and stored procedures.

[Upstream project](https://www.postgresql.org)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/postgresql
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/postgresql --version 17.1.0
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
- [`postgres-nixchart`](../../images/postgres-nixchart/)
- [`prometheus-postgres-exporter-nixchart`](../../images/prometheus-postgres-exporter-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/postgresql>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `17.1.0` · App version: `17.6.0`
