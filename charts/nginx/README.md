# nginx

Helm chart for **nginx** — NGINX Open Source is a web server that can be also used as a reverse proxy, load balancer, and HTTP cache. Recommended for high-demanding sites due to its ability to provide faster content.

[Upstream project](https://www.nginx.org)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/nginx
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/nginx --version 22.1.1
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

- [`git-nixchart`](../../images/git-nixchart/)
- [`nginx-nixchart`](../../images/nginx-nixchart/)
- [`nginx-prometheus-exporter-nixchart`](../../images/nginx-prometheus-exporter-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/nginx>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `22.1.1` · App version: `1.29.1`
