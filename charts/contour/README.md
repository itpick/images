# contour

Helm chart for **contour** — Contour is an open source Kubernetes ingress controller that works by deploying the Envoy proxy as a reverse proxy and load balancer.

[Upstream project](https://projectcontour.io)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/contour
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/contour --version 21.1.5
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

- [`contour-nixchart`](../../images/contour-nixchart/)
- [`envoy-nixchart`](../../images/envoy-nixchart/)
- [`nginx-nixchart`](../../images/nginx-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/contour>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `21.1.5` · App version: `1.32.1`
