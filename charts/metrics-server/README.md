# metrics-server

Helm chart for **metrics-server** — Metrics Server aggregates resource usage data, such as container CPU and memory usage, in a Kubernetes cluster and makes it available via the Metrics API.

[Upstream project](https://github.com/kubernetes-sigs/metrics-server)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/metrics-server
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/metrics-server --version 7.4.13
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

- [`metrics-server-nixchart`](../../images/metrics-server-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/metrics-server>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `7.4.13` · App version: `0.8.0`
