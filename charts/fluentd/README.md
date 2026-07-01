# fluentd

Helm chart for **fluentd** — Fluentd collects events from various data sources and writes them to files, RDBMS, NoSQL, IaaS, SaaS, Hadoop and so on.

[Upstream project](https://www.fluentd.org)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/fluentd
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/fluentd --version 7.2.6
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

- [`fluentd-nixchart`](../../images/fluentd-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/fluentd>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `7.2.6` · App version: `1.19.0`
