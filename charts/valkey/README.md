# valkey

Helm chart for **valkey** — Valkey is an open source (BSD) high-performance key/value datastore that supports a variety workloads such as caching, message queues, and can act as a primary database.

[Upstream project](https://valkey.io)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/valkey
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/valkey --version 4.0.2
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

- [`kubectl-nixchart`](../../images/kubectl-nixchart/)
- [`os-shell-nixchart`](../../images/os-shell-nixchart/)
- [`prometheus-redis-exporter-nixchart`](../../images/prometheus-redis-exporter-nixchart/)
- [`valkey-nixchart`](../../images/valkey-nixchart/)
- [`valkey-sentinel-nixchart`](../../images/valkey-sentinel-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/valkey>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `4.0.2` · App version: `8.1.3`
