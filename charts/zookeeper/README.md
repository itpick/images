# zookeeper

Helm chart for **zookeeper** — Apache ZooKeeper provides a reliable, centralized register of configuration data and services for distributed applications.

[Upstream project](https://zookeeper.apache.org)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/zookeeper
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/zookeeper --version 13.8.8
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
- [`zookeeper-nixchart`](../../images/zookeeper-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/zookeeper>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `13.8.8` · App version: `3.9.3`
