# external-dns

Helm chart for **external-dns** — ExternalDNS is a Kubernetes addon that configures public DNS servers with information about exposed Kubernetes services to make them discoverable.

[Upstream project](https://github.com/kubernetes-sigs/external-dns)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/external-dns
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/external-dns --version 9.0.4
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

- [`external-dns-nixchart`](../../images/external-dns-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/external-dns>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `9.0.4` · App version: `0.18.0`
