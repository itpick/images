# haproxy

Helm chart for **haproxy** — HAProxy is a TCP proxy and a HTTP reverse proxy. It supports SSL termination and offloading, TCP and HTTP normalization, traffic regulation, caching and protection against DDoS attacks.

[Upstream project](https://www.haproxy.org)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/haproxy
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/haproxy --version 3.0.1
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

- [`haproxy-nixchart`](../../images/haproxy-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/haproxy>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `3.0.1` · App version: `3.2.4`
