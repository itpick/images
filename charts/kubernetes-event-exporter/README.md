# kubernetes-event-exporter

Helm chart for **kubernetes-event-exporter** — Kubernetes Event Exporter makes it easy to export Kubernetes events to other tools, thereby enabling better event observability, custom alerts and aggregation.

[Upstream project](https://github.com/resmoio/kubernetes-event-exporter)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/kubernetes-event-exporter
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/kubernetes-event-exporter --version 3.6.4
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

- [`kubernetes-event-exporter-nixchart`](../../images/kubernetes-event-exporter-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/kubernetes-event-exporter>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `3.6.4` · App version: `1.7.0`
