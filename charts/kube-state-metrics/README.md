# kube-state-metrics

Helm chart for **kube-state-metrics** — kube-state-metrics is a simple service that listens to the Kubernetes API server and generates metrics about the state of the objects.

[Upstream project](https://github.com/kubernetes/kube-state-metrics)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/kube-state-metrics
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/kube-state-metrics --version 5.1.1
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

- [`kube-state-metrics-nixchart`](../../images/kube-state-metrics-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/kube-state-metrics>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `5.1.1` · App version: `2.16.0`
