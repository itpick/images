# postgresql-ha

Helm chart for **postgresql-ha** — This PostgreSQL cluster solution includes the PostgreSQL replication manager, an open-source tool for managing replication and failover on PostgreSQL clusters.

[Upstream project](https://www.postgresql.org)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/postgresql-ha
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/postgresql-ha --version 16.3.4
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
- [`pgpool2-nixchart`](../../images/pgpool2-nixchart/)
- [`postgres-repmgr-nixchart`](../../images/postgres-repmgr-nixchart/)
- [`prometheus-postgres-exporter-nixchart`](../../images/prometheus-postgres-exporter-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/postgresql-ha>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `16.3.4` · App version: `17.6.0`
