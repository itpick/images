# superset

Helm chart for **superset** — Superset is a modern data exploration and data visualization platform.

[Upstream project](https://superset.apache.org)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/superset
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/superset --version 5.0.1
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

- [`superset-nixchart`](../../images/superset-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/superset>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `5.0.1` · App version: `5.0.0`
