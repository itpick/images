# memcached

Helm chart for **memcached** — Memcached is an high-performance, distributed memory object caching system, generic in nature, but intended for use in speeding up dynamic web applications by alleviating database load.

[Upstream project](https://memcached.org)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/memcached
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/memcached --version 8.0.0
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

- [`memcached-exporter-nixchart`](../../images/memcached-exporter-nixchart/)
- [`memcached-nixchart`](../../images/memcached-nixchart/)
- [`os-shell-nixchart`](../../images/os-shell-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/memcached>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `8.0.0` · App version: `1.6.39`
