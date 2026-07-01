# oauth2-proxy

Helm chart for **oauth2-proxy** — A reverse proxy and static file server that provides authentication using Providers (Google, GitHub, and others) to validate accounts by email, domain or group.

[Upstream project](https://github.com/oauth2-proxy/oauth2-proxy)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/oauth2-proxy
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/oauth2-proxy --version 8.0.3
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

- [`oauth2-proxy-nixchart`](../../images/oauth2-proxy-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/oauth2-proxy>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `8.0.3` · App version: `7.12.0`
