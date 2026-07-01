# mysql

Helm chart for **mysql** — MySQL is a fast, reliable, scalable, and easy to use open source relational database system. Designed to handle mission-critical, heavy-load production applications.

[Upstream project](https://www.mysql.com)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/mysql
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/mysql --version 14.0.5
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

- [`mysql-nixchart`](../../images/mysql-nixchart/)
- [`os-shell-nixchart`](../../images/os-shell-nixchart/)
- [`prometheus-mysqld-exporter-nixchart`](../../images/prometheus-mysqld-exporter-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/mysql>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `14.0.5` · App version: `9.4.0`
