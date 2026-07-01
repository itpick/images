# etcd

Helm chart for **etcd** — etcd is a distributed key-value store designed to securely store data across a cluster. etcd is widely used in production on account of its reliability, fault-tolerance and ease of use.

[Upstream project](https://etcd.io)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/etcd
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/etcd --version 12.0.20
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

- [`etcd-nixchart`](../../images/etcd-nixchart/)
- [`os-shell-nixchart`](../../images/os-shell-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/etcd>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `12.0.20` · App version: `3.6.4`
