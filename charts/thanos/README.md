# thanos

Helm chart for **thanos** — Thanos is a highly available metrics system that can be added on top of existing Prometheus deployments, providing a global query view across all Prometheus installations.

[Upstream project](https://thanos.io)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/thanos
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/thanos --version 17.6.0
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
- [`thanos-nixchart`](../../images/thanos-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/thanos>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `17.6.0` · App version: `0.39.2`
